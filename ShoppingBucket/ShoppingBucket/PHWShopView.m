//
//  PHWShopView.m
//  ShoppingBucket
//
//  Created by paul on 6/18/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "PHWShopView.h"
#import "Bucket.h"


@interface PHWShopView()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation PHWShopView

- (void)setShop:(Bucket *)shop{
    _shop = shop;
    
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
    
    
}
+ (instancetype)shopView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}


@end
