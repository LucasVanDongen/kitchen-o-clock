//
//  Timer.m
//  OvoTest
//
//  Created by Lucas van Dongen on 24-08-13.
//  Copyright (c) 2013 Lucas van Dongen. All rights reserved.
//

#import "Timer.h"

@implementation Timer

- (Timer *)init;
{
    if (self == nil)
    {
        self = [self init];
    }

    self.isStopped = true;
    
    return self;
}

// Code smell, should be refactored
- (void)initialize:(int)secondsToTime;
{
    self.timeLeft = secondsToTime;
    bool wasPaused = self.isPaused;
    [self start];

    if (wasPaused)
    {
        [self pause];
    }
}

- (void)reStart;
{
    self.timeLeft = self.originalSetTime;
    [self start];
}

- (void)start;
{
    [self set];

    self.isBeingStopped = false;
    self.isBeingPaused = false;
    self.isStopped = false;
    self.isPaused = false;
    
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerStart" object:self];
    }

    [self timerUpdate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[[NSDate alloc] init] forKey:@"timeOfTermination"];
    [defaults setObject:[NSNumber numberWithInt:self.originalSetTime] forKey:@"setTimeWhenTerminated"];
    [defaults synchronize];
}

- (void)stop;
{
    self.isBeingStopped = true;
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerStop" object:self];
    }
}

- (void)pause;
{
    self.pauseBufferTimeStart = CACurrentMediaTime();
    self.isBeingPaused = true;

    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerPause" object:self];
    }
}

- (void)unPause;
{
    self.startTime = CACurrentMediaTime();
    self.totalTimerLength = self.timeLeft;
    self.expirationTime = self.startTime + self.timeLeft;
    
    self.isBeingPaused = false;
    self.isPaused = false;
    
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerStart" object:self];
    }
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.pauseBufferTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.timeLeft--;
        [self timerUpdate];
    });
}

- (bool)isRunning;
{
    return !self.isStopped && !self.isPaused;
}

- (void)set;
{
    self.startTime = CACurrentMediaTime();
    self.totalTimerLength = self.timeLeft;
    self.originalSetTime = self.timeLeft;
    self.expirationTime = self.startTime + self.timeLeft;
}

- (void)timerUpdate;
{
    if (self.isBeingPaused)
    {
        self.pauseBufferTime = CACurrentMediaTime() - self.pauseBufferTimeStart;
        self.isPaused = true;
        return;
    }
    
    double currentTime = CACurrentMediaTime();
    double timeExpired = currentTime - self.startTime;
    self.timeLeft = self.totalTimerLength - round(timeExpired);
    
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerUpdate" object:self];
    }
    else if (self.timeLeft <= 10)
    {
        //[BadgeHandler setCount:self.timeLeft];
    }
    
    if (self.isBeingStopped)
    {
        self.timeLeft = 0;
    }
    
    if (self.timeLeft <= 0)
    {
        if (self.timeLeft == 0 && !self.isBeingStopped)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"timerFinish" object:self];
        }
        else
        {
            // This shouldn't happen but if it does it should not show weird stuff in the GUI at least
            self.timeLeft = 0;
        }
        
        self.isBeingStopped = true;
        self.isStopped = true;

        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerStop" object:self];
    
        return;
    }
    
    double timeToNextUpdate = self.totalTimerLength - timeExpired - self.timeLeft + 1;
    
    //NSLog(@"Time to next update: %f", timeToNextUpdate);
    
    if (timeToNextUpdate < 0.1)
    {
        timeToNextUpdate = 0.1;
    }
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeToNextUpdate * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self timerUpdate];
    });
    
}

@end
