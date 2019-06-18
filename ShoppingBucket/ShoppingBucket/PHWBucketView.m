//
//  PHWBucketView.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "PHWBucketView.h"
@interface PHWBucketView()


@end


@implementation PHWBucketView



/**
 initialize sub controller

 @return <#return value description#>
 */
- (instancetype) init{
    if (self == [super init]){
        //
//
//        CGFloat width = self.frame.size.width;
//        CGFloat height = self.frame.size.height;
        
        
        // add image
        UIImageView *iconView = [[UIImageView alloc] init];
//        iconView.frame = CGRectMake(0, 0, width, width);
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        // add lable
        UILabel *itemLabel = [[UILabel alloc] init];
//        itemLabel.frame = CGRectMake(0, width, width, height-width);
        itemLabel.backgroundColor = [UIColor yellowColor];
        itemLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:itemLabel];
        self.itemLabel = itemLabel;
    }
    return self;
}

/**
 to get the frame size
 */
- (void) layoutSubviews{
    // must call super
    [super layoutSubviews];
    
    // get the current frame size
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // setup subview frame
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.itemLabel.frame = CGRectMake(0, width, width, height-width);
}

@end
