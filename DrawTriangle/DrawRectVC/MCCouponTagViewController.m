//
//  MCCouponTagViewController.m
//  DrawTriangle
//
//  Created by xibHe on 2019/11/21.
//  Copyright © 2019 Peng he. All rights reserved.
//

#import "MCCouponTagViewController.h"
#import "MCCouponTagLabel.h"

@interface MCCouponTagViewController ()

@end

@implementation MCCouponTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MCCouponTagLabel *couponTagLabel = [[MCCouponTagLabel alloc] initWithFrame:CGRectMake(200, 300, 100, 60)];
    couponTagLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:couponTagLabel];
}



@end
