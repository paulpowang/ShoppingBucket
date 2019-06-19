//
//  PHWShopView.h
//  ShoppingBucket
//
//  Created by paul on 6/18/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@class Bucket;

@interface PHWShopView : UIView

@property (nonatomic, strong) Bucket *shop;

+ (instancetype) shopView;


@end

NS_ASSUME_NONNULL_END
