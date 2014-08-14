//
//  CCDetailViewController.h
//  Wallpaper+
//
//  Created by Standard on 8/13/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCDetailViewController : UIViewController<UIScrollViewDelegate>


@property (strong, nonatomic)NSMutableArray *wallpaperArray;
@property (strong, nonatomic)NSString *currentWallpaperName;
@property (nonatomic) NSInteger indexOfWallpaper;

@end
