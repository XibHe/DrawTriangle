//
//  MCCouponTagLabel.m
//  DrawTriangle
//
//  Created by xibHe on 2019/11/20.
//  Copyright © 2019 Peng he. All rights reserved.
//

#import "MCCouponTagLabel.h"

@implementation MCCouponTagLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawRect:frame];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    UIColor *color = [UIColor cyanColor];
    // 设置线条颜色.
    [color set];
    // 宽 高.
    CGFloat w = self.frame.size.width;  // 100
    CGFloat h = self.frame.size.height; // 60
    
//    [[UIColor greenColor] setStroke];
//    [[UIColor blueColor] setFill];
//
//    UIBezierPath *yPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 330, 100, 100)];
//    [yPath appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 330, 100, 100)]];
//    yPath.usesEvenOddFillRule = YES;
//    [self addPath:yPath];
    
    // 二次贝塞尔曲线的支持.
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    // 开始的点.
    [bPath moveToPoint:CGPointMake(100/2-15, h)];
    // 终止点, 控制点.
    [bPath addQuadCurveToPoint:CGPointMake(50-(100/2-15)+50, h) controlPoint:CGPointMake(50, 60/1.5)];
    [bPath fill];
}

//- (void)addPath:(UIBezierPath *)path {
//    path.lineWidth = 4;
//    [path stroke];
//    [path fill];
//}

////二次贝塞尔
//UIBezierPath *towPath = [UIBezierPath bezierPath];
//[towPath moveToPoint:CGPointMake(150, 210)];
//[towPath addQuadCurveToPoint:CGPointMake(150, 310) controlPoint:CGPointMake(250, 260)];
//[towPath stroke];

@end
