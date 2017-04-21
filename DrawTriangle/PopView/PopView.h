//
//  PopView.h
//  DrawTriangle
//
//  弹出view
//
//  Created by Peng he on 2017/4/21.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView

@property (nonatomic, copy) void (^ closePopViewBlock) ();   // 关闭弹出视图

@end
