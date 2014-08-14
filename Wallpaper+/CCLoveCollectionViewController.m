//
//  CCLoveCollectionViewController.m
//  Wallpaper+
//
//  Created by Standard on 8/13/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCLoveCollectionViewController.h"
#import "CCPhotoCollectionViewCell.h"
#import "CCDetailViewController.h"

@interface CCLoveCollectionViewController ()

@end

@implementation CCLoveCollectionViewController

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
    //    NSLog(@"category name: %@", self.categoryName);
    self.title = self.categoryName;
    NSArray *dirContent = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContent.count];
    for (NSString *string in dirContent) {
        
        if ([string hasSuffix:[NSString stringWithFormat:@"_%@.jpg", self.categoryName]] ||
            [string hasSuffix:[NSString stringWithFormat:@"_%@.png", self.categoryName]] ||
            [string hasSuffix:[NSString stringWithFormat:@"_%@.JPG", self.categoryName]] ||
            [string hasSuffix:[NSString stringWithFormat:@"_%@.PNG", self.categoryName]]) {
            [tempArray addObject:string];
            
        }
    }
    NSLog(@"found %d image", tempArray.count);
    self.wallpaperArray = [[NSArray arrayWithArray:tempArray]mutableCopy];
    
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     
     if ([segue.identifier isEqualToString:@"detailSegue"]) {
         if ([segue.destinationViewController isKindOfClass:[CCDetailViewController class]]) {
             NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]lastObject];
             CCDetailViewController *ccDetailVC = segue.destinationViewController;
             ccDetailVC.wallpaperArray = self.wallpaperArray;
//             ccDetailVC.currentWallpaperName = self.wallpaperArray[indexPath.row];
             ccDetailVC.indexOfWallpaper = indexPath.row;
             
         }
         
     }
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }


#pragma mark - CollectionView DataSoure

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.wallpaperArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"photoCell";
    CCPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //    cell.imageView.image = [UIImage imageNamed:@"1_love.jpg"];
    NSString *imageName = [self.wallpaperArray objectAtIndex:indexPath.row];
    //    NSLog(@"image name: %@", imageName);
    
    cell.backgroundColor = [UIColor whiteColor];
    
    
    
    cell.imageView.image = [UIImage imageWithContentsOfFile:imageName];
    
    
    return cell;
}

@end
