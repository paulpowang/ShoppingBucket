//
//  ViewController.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "ViewController.h"
#import "Bucket.h"
//#import "PHWBucketView.h"
#import "PHWShopView.h"

@interface ViewController ()

// bucket
@property (weak, nonatomic) IBOutlet UIView *bucketView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) IBOutlet UIButton *removeButton;
// alarm text
@property (weak, nonatomic) IBOutlet UILabel *showHUB;


// item index
//@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (NSArray *)dataArr{
    if(_dataArr == nil){
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData.plist" ofType:nil];
        self.dataArr = [NSMutableArray arrayWithContentsOfFile:dataPath];
        
        // create a temp array
        NSMutableArray *tempArr = [NSMutableArray array];

        // turn dictionary into model
        for (NSDictionary *dict in self.dataArr){

            // add model into temp array
            Bucket *bucketItem = [Bucket shopWithDict:dict];
            [tempArr addObject:bucketItem];

        }
        self.dataArr = tempArr;
    }
    
    
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/**
 add to bucket
 

 @param sender button
 */
- (IBAction)add:(UIButton *)button {
    
    // **** define columns and row
    // total 3 columns
    NSInteger allCols = 3;
    // item width and height
    CGFloat width = 80;
    CGFloat height = 100;
    // horizontal margin
    CGFloat hMargin = (self.bucketView.frame.size.width - allCols * width) / (allCols-1);
    CGFloat vMargin = (self.bucketView.frame.size.height - 2 * height) / 1;
    NSInteger index = self.bucketView.subviews.count;
    
    // get x value
    CGFloat x = (hMargin + width) * (index % allCols);
    CGFloat y = (vMargin + height) * (index/allCols);
    
    // ******** setup data
    Bucket *item = self.dataArr[index];
//    PHWBucketView *shopView = [PHWBucketView bucketViewWithBucket:item];
    PHWShopView *shopView = [PHWShopView shopView];
    shopView.frame = CGRectMake(x, y, width, height);
    shopView.shop = self.dataArr[index];
    [self.bucketView addSubview:shopView];

    // ****** setup add button status
    if (index == 5){
        button.enabled = false;
        
        
    }
    // set alarm text HUB
    if (index == 5){
        
        [self showWithInfo:@"Shop Car is already full"];
        
        
    }
    
    // **** setup remove button status
    self.removeButton.enabled = true;

}

/**
 remove from bucket

 @param sender button
 */
- (IBAction)remove:(UIButton *)button {
    
    // remove the last item
    UIView *lastItemView = [self.bucketView.subviews lastObject];
    [lastItemView removeFromSuperview];
    
    
    // remove button status
    if (self.bucketView.subviews.count == 0){
        self.removeButton.enabled = false;
    }
    
    
    if (self.bucketView.subviews.count == 0){
        
        
        [self showWithInfo:@"Shop Car is Empty."];
        
        
    }
    // add button will be enable after remove item
    self.addButton.enabled = true;
    
//    self.index -= 1;
}

- (void) showWithInfo: (NSString *) info{
    [UIView animateWithDuration:2.0 animations:^{
        self.showHUB.text = info;
        self.showHUB.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.showHUB.alpha = 0;
        } completion:nil];
    }];
}


@end
