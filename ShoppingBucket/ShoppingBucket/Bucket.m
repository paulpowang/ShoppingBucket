//
//  Bucket.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "Bucket.h"

@implementation Bucket


-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self == [super init]){
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype) shopWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict: dict];
}

@end
