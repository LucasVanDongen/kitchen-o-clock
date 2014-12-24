//
//  Timer.h
//  OvoTest
//
//  Created by Lucas van Dongen on 24-08-13.
//  Copyright (c) 2013 Lucas van Dongen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Timer : NSObject

// This class exposes way too many properties, should be more encapsulated

@property int timeLeft;
@property int totalTimerLength;
@property int originalSetTime;
@property CFTimeInterval startTime;
@property double expirationTime;
@property double pauseBufferTime;
@property double pauseBufferTimeStart;
@property bool isBeingStopped;
@property bool isBeingPaused;
@property bool isStopped;
@property bool isPaused;

- (void) initialize:(int)secondsToTime;
- (void) start;
- (void) reStart;
- (void) stop;
- (void) pause;
- (void) unPause;
- (bool) isRunning;

- (void) timerUpdate;

@end
