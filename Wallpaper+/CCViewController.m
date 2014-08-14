//
//  CCViewController.m
//  Wallpaper+
//
//  Created by Standard on 8/13/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCViewController.h"
#import "CCAppDelegate.h"
#import "CCLoveCollectionViewController.h"


@interface CCViewController ()

@property (strong, nonatomic) IBOutlet UIButton *musicButton;
@property (strong, nonatomic) IBOutlet UIButton *loveWallpaperButton;


@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)musicButtonPressed:(UIButton *)sender {
    
    CCAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (sender.selected) {
        //        self.musicButton.titleLabel.text = @"Pause";
        [sender setSelected:NO];
        [appDelegate playMusic];
        [self.musicButton setImage:[UIImage imageNamed:@"sound_play_btn.png"] forState:UIControlStateNormal];
        
    }
    else{
        //        self.musicButton.titleLabel.text = @"Music";
        [sender setSelected:YES];
        [appDelegate pauseMusic];
        [self.musicButton setImage:[UIImage imageNamed:@"sound_mute_btn.png"] forState:UIControlStateNormal];
    }
    
}

#pragma mark - Helper method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toCollectionView"]) {
        if ([segue.destinationViewController isKindOfClass:[UICollectionViewController class]]) {
            NSLog(@"category: %@", self.categoryName);
            CCLoveCollectionViewController *ccLoveCollectionVC = segue.destinationViewController;
//            ccLoveCollectionVC.categoryName = self.categoryName;
            ccLoveCollectionVC.categoryName = sender;
        }
    }
}

#pragma mark - IBAction

- (IBAction)loveWallpaperButtonPressed:(UIButton *)sender {
//    NSLog(@"%@", sender);
    
    self.categoryName = @"love";
    [self performSegueWithIdentifier:@"toCollectionView" sender:self.categoryName];
    NSLog(@"lovebutton pressed");
    
}

- (IBAction)natureWallpaperButtonPressed:(UIButton *)sender {
    self.categoryName = @"nature";
    [self performSegueWithIdentifier:@"toCollectionView" sender:self.categoryName];
    NSLog(@"naturebutton pressed");
}

@end
