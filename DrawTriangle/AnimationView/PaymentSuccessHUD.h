//
//  PaymentSuccessHUD.h
//  DrawTriangle
//
//  Created by zyjk_iMac-penghe on 2017/12/4.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentSuccessHUD : UIView<CAAnimationDelegate>

-(void)start;

-(void)hide;

+ (PaymentSuccessHUD *)showIn:(UIView*)view;

+ (PaymentSuccessHUD *)hideIn:(UIView*)view;

@end
