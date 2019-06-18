//
//  Bucket.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "Bucket.h"

@implementation Bucket

//-(instancetype) initWithIcon:(NSString *)icon name:(NSString *)name{
//    if(self = [super init]){
//        self.icon = icon;
//        self.name = name;
//    }
//    return self;
//}
//
//+ (instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name{
//    return [[self alloc] initWithIcon:icon name:name];
//}


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
