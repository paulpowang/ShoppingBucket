//
//  main.m
//  PlistGenerator
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        
        
        NSArray *dataArr = @[
                         @{@"name":@"cherry", @"icon":@"cherry"},
                         @{@"name":@"windmill", @"icon":@"windmill"},
                         @{@"name":@"strawberry", @"icon":@"strawberry"},
                         @{@"name":@"raspberry", @"icon":@"raspberry"},
                         @{@"name":@"grapes", @"icon":@"grapes"},
                         @{@"name":@"champagne", @"icon":@"champagne"}
                         
                         ];
        BOOL flag = [dataArr writeToFile:@"/Users/paul/Desktop/shopData.plist" atomically:true];
        
        if(flag){
            NSLog(@"Write succeed!!");
        }
    }
    return 0;
}
