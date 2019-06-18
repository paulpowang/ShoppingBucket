//
//  PHWBucketView.h
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Bucket;

@interface PHWBucketView : UIView
//@property (nonatomic, weak) UIImageView *iconView;
//@property (nonatomic, weak) UILabel *itemLabel;

// interface function
//- (void)setIcon: (NSString *) icon;
//- (void)setName: (NSString *) name;
@property (nonatomic,strong) Bucket *bucketItem;

- (instancetype) initWithBucket: (Bucket *) bucket;
+ (instancetype) bucketViewWithBucket: (Bucket *) bucket;


@end

NS_ASSUME_NONNULL_END
