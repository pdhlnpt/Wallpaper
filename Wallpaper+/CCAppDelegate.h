//
//  CCAppDelegate.h
//  Wallpaper+
//
//  Created by Standard on 8/13/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface CCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)AVAudioPlayer *backGroundMusic;

- (void)playMusic;
- (void)pauseMusic;

@end
