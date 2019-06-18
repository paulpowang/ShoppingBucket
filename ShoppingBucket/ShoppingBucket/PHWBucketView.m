//
//  PHWBucketView.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "PHWBucketView.h"
#import "Bucket.h"
@interface PHWBucketView()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *itemLabel;

@end


@implementation PHWBucketView



/**
 initialize sub controller

 @return <#return value description#>
 */
- (instancetype) init{
    if (self == [super init]){
      
        [self setUp];
        
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

- (void)setIcon:(NSString *)icon{
    self.iconView.image = [UIImage imageNamed:icon];
}
- (void)setName:(NSString *)name{
    self.itemLabel.text = name;
}


/**
 set function: for set up bucket item

 @param bucket <#bucket description#>
 */
- (void)setBucketItem:(Bucket *)bucketItem{
    _bucketItem = bucketItem;
    
    // setup data
    self.iconView.image = [UIImage imageNamed:bucketItem.icon];
    self.itemLabel.text = bucketItem.name;
}

- (instancetype)initWithBucket:(Bucket *)bucket{
    if (self == [super init]){
        
        [self setUp];
        self.bucketItem = bucket;
    }
    return self;
}
+ (instancetype)bucketViewWithBucket:(Bucket *)bucket{
    return [[self alloc] initWithBucket:bucket];
}

/**
 initialize setup
 */
- (void) setUp{
    // add image
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor blueColor];
    [self addSubview:iconView];
    self.iconView = iconView;
    
    // add lable
    UILabel *itemLabel = [[UILabel alloc] init];
    itemLabel.backgroundColor = [UIColor yellowColor];
    itemLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:itemLabel];
    self.itemLabel = itemLabel;
}

@end
