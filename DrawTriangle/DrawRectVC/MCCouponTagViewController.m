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
    MCCouponTagLabel *couponTagLabel = [[MCCouponTagLabel alloc] initWithFrame:CGRectMake(self.view.center.x - 100/2, self.view.center.y - 60/2, 100, 60) text:@"测试标签" textColor:@"" backgroundColor:@"" cornerRadius:2];
    [self.view addSubview:couponTagLabel];
}

@end
