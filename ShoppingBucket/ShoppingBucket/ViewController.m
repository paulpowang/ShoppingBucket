//
//  ViewController.m
//  ShoppingBucket
//
//  Created by paul on 6/17/19.
//  Copyright © 2019 PoHung Wang. All rights reserved.
//

#import "ViewController.h"
#import "Bucket.h"
#import "PHWBucketView.h"

@interface ViewController ()

// bucket
@property (weak, nonatomic) IBOutlet UIView *bucketView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) IBOutlet UIButton *removeButton;


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
//            Bucket *newbucket = [[Bucket alloc] initWithIcon:dict[@"icon"] name:dict[@"name"]];
//            newbucket.name = dict[@"name"];
//            newbucket.icon = dict[@"icon"];
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
    
//    self.index = 0;
    
//    // deal with item overflow
//    self.bucketView.clipsToBounds = true;
    
//    NSArray<NSDictionary *> *dataArr = @[
//                                         @{@"name":@"cherry", @"icon":@"cherry"},
//                                         @{@"name":@"windmill", @"icon":@"windmill"},
//                                         @{@"name":@"strawberry", @"icon":@"strawberry"},
//                                         @{@"name":@"raspberry", @"icon":@"raspberry"},
//                                         @{@"name":@"grapes", @"icon":@"grapes"},
//                                         @{@"name":@"champagne", @"icon":@"champagne"}
//                                         
//                                         ];
//    self.dataArr = dataArr;
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
    
    /* move to PHWBucketView.m
    // ****** Create Item and add to bucket
    // create itemviews
    UIView *shopView = [[UIView alloc] init];
    // setup frame
    shopView.frame = CGRectMake(x, y, width, height);
    // background color
    shopView.backgroundColor = [UIColor greenColor];
    // add to bucket
    [self.bucketView addSubview:shopView];
    
    
    // add image
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(0, 0, width, width);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    
    // add lable
    UILabel *itemLabel = [[UILabel alloc] init];
    itemLabel.frame = CGRectMake(0, width, width, height-width);
    itemLabel.backgroundColor = [UIColor yellowColor];
    itemLabel.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:itemLabel];
    */
    PHWBucketView *shopView = [[PHWBucketView alloc] init];
    shopView.frame = CGRectMake(x, y, width, height);
    [self.bucketView addSubview:shopView];
    
    // ******** setup data

    //assign data
    
    Bucket *item = self.dataArr[index];
//    shopView.iconView.image = [UIImage imageNamed:item.icon];
//    shopView.itemLabel.text = item.name;
    [shopView setIcon:item.icon];
    [shopView setName:item.name];
    
    
    
    // ****** setup add button status
    if (index == 5){
        button.enabled = false;
    }
    
    // **** setup remove button status
    self.removeButton.enabled = true;
    
    
    // add 1 to index
//    self.index += 1;
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
    // add button will be enable after remove item
    self.addButton.enabled = true;
    
//    self.index -= 1;
}


@end
