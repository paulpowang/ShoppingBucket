//
//  Bucket.h
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bucket : NSObject
// icon name
@property (nonatomic, copy) NSString *icon;
// lable text
@property (nonatomic, copy) NSString *name;


// constructor
//- (instancetype) initWithIcon: (NSString *)icon name: (NSString *) name;
//+ (instancetype) shopWithIcon: (NSString *)icon name: (NSString *) name;
- (instancetype)initWithDict:(NSDictionary *) dict;
+ (instancetype) shopWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
