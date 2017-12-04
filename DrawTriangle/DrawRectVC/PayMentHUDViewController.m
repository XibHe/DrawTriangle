//
//  PayMentHUDViewController.m
//  DrawTriangle
//
//  Created by zyjk_iMac-penghe on 2017/12/4.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "PayMentHUDViewController.h"
#import "PaymentSuccessHUD.h"

@interface PayMentHUDViewController ()

@end

@implementation PayMentHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"支付完成" style:UIBarButtonItemStylePlain target:self action:@selector(showSuccessAnimation)];
}

- (void)showSuccessAnimation
{
    self.title = @"付款完成";
    [PaymentSuccessHUD showIn:self.view];
}

@end
