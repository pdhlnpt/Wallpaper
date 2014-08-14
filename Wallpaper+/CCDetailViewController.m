//
//  CCDetailViewController.m
//  Wallpaper+
//
//  Created by Standard on 8/13/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCDetailViewController.h"

@interface CCDetailViewController ()
//@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic)CGRect frameCell;

@property (strong, nonatomic) IBOutlet UILabel *indexLabel;


@end

@implementation CCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.currentWallpaperName = [self.wallpaperArray objectAtIndex:self.indexOfWallpaper];
    NSLog(@"current wallpaper name: %@", self.currentWallpaperName);
    //    NSLog(@"number of image: %d", [self.wallpaperArray count]);
    //    self.imageView.image = [UIImage imageWithContentsOfFile:self.currentWallpaperName];
    
    self.frameCell = self.scrollView.frame;
//    CGRect currentFrame = CGRectMake(self.frameCell.size.width * self.indexOfWallpaper, 0, self.frameCell.size.width, self.frameCell.size.height);
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.frameCell.size.width * [self.wallpaperArray count], self.frameCell.size.height)];

    
    [self loadScrollView];
    [self loadCurrentScrollView];
//    [self.scrollView scrollRectToVisible:currentFrame animated:YES];
    self.scrollView.delegate =self;
    
    
    self.indexLabel.text = [NSString stringWithFormat:@"%d of %d", self.indexOfWallpaper + 1, [self.wallpaperArray count]
                            ];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - IBAction

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"did Cancel");
}

- (IBAction)saveImageButtonPressed:(UIButton *)sender {
    
    UIImage *tempImage = [UIImage imageWithContentsOfFile:[self.wallpaperArray objectAtIndex:self.indexOfWallpaper]];
    UIImageWriteToSavedPhotosAlbum(tempImage, nil, nil, nil);
    //    [self dismissViewControllerAnimated:YES completion:nil];
    UIAlertView *imageSavedAlert = [[UIAlertView alloc] initWithTitle:@"DONE!!" message:@"Skin background is saved into Camera Roll, Please go to Setting -> Wallpaper to change!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [imageSavedAlert show];
    
}

- (IBAction)previousButtonPressed:(UIButton *)sender {
    
    if (self.indexOfWallpaper == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"You Reach The Top Of Category!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else{
        [self previousWallpaper];
    }
}


- (IBAction)nextButtonPressed:(UIButton *)sender {
    
    if (self.indexOfWallpaper == [self.wallpaperArray count] - 1) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"You Reach The End Of Category!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else{
        [self nextWallpaper];
    }
    
}


#pragma mark - helper method

- (void)addImage: (UIImage *)image atPosition: (NSInteger )postion
{
    UIImageView *tmpImage = [[UIImageView alloc]init];
    tmpImage.image = image;
    tmpImage.frame = CGRectMake(self.frameCell.size.width * postion, 0, self.frameCell.size.width, self.frameCell.size.height);
    [self.scrollView addSubview:tmpImage];
    
    
}


- (void)loadScrollView
{
    for (int i = 0; i < [self.wallpaperArray count]; i++) {
        
        UIImage *tempImage = [UIImage imageWithContentsOfFile:[self.wallpaperArray objectAtIndex:i]];
        
        [self addImage:tempImage atPosition:i];
        
        
    }
}
- (void)loadCurrentScrollView
{
    CGRect currentFrame = CGRectMake(self.frameCell.size.width * self.indexOfWallpaper, 0, self.frameCell.size.width, self.frameCell.size.height);
    [self.scrollView scrollRectToVisible:currentFrame animated:YES];
}

- (void)previousWallpaper
{
    self.indexOfWallpaper--;
    [self loadCurrentScrollView];
    
    
}

- (void)nextWallpaper
{
    self.indexOfWallpaper++;
    [self loadCurrentScrollView];
    

    
}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.frameCell.size.width;
    self.indexOfWallpaper = floor((self.scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    //    NSLog(@"scroll");
    self.indexLabel.text = [NSString stringWithFormat:@"%d of %d", self.indexOfWallpaper+1, [self.wallpaperArray count]];
    
    
}


@end
