//
//  CCPhotoCollectionViewCell.m
//  CollectionView
//
//  Created by Standard on 8/4/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCPhotoCollectionViewCell.h"
#define IMAGEVIEW_BODER_LENGHT 5

@implementation CCPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
        
    }
    return  self;
}

- (void)setup
{
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BODER_LENGHT, IMAGEVIEW_BODER_LENGHT)];
    [self.contentView addSubview:self.imageView];
    
}


@end
