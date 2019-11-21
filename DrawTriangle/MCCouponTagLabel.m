//
//  MCCouponTagLabel.m
//  DrawTriangle
//
//  Created by xibHe on 2019/11/20.
//  Copyright © 2019 Peng he. All rights reserved.
//

#import "MCCouponTagLabel.h"

@implementation MCCouponTagLabel

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text textColor:(NSString *)textColor backgroundColor:(NSString *)backgroundColor cornerRadius:(NSInteger)cornerRadius {
    if (self = [super initWithFrame:frame]) {
        
        self.text = text;
        self.font = [UIFont systemFontOfSize:16];
        self.textAlignment = NSTextAlignmentCenter;
        // 文本颜色
        self.textColor = [UIColor blackColor];
        // 背景色
        self.backgroundColor = [UIColor redColor];
        // 标签的边框宽度值
//        self.layer.borderWidth = 0.6f;
        // 标签圆角的半径，最大为标签控件高度的一半，也就是半圆样式。tag标签高度为15px
//        CGFloat viewMaxCornerRadius = 7.5;
        self.layer.cornerRadius = cornerRadius;
//        (cornerRadius <= viewMaxCornerRadius) ? cornerRadius : viewMaxCornerRadius;
        self.layer.masksToBounds = YES;
//        [self sizeToFit];
        
        [self drawRect:frame];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIColor *color = [UIColor whiteColor];
    // 设置线条颜色.
    [color set];
    
    // 宽 高 终止点偏移
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat pointDifferential = height / 6;
    CGFloat pointMiddle = height / 2;
    
    // 二次贝塞尔曲线的支持. (左侧)
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    // 开始的点
    [leftPath moveToPoint:CGPointMake(0,height/2 - pointDifferential)];
    // 终止点, 控制点
    [leftPath addQuadCurveToPoint:CGPointMake(0, height - (height/2 - pointDifferential)) controlPoint:CGPointMake(pointMiddle/2, pointMiddle)];
    [leftPath bezierPathByReversingPath];
    [leftPath fill];
    
    // 二次贝塞尔曲线的支持. (右侧)
    UIBezierPath *rightPath = [UIBezierPath bezierPath];
    // 开始的点.
    [rightPath moveToPoint:CGPointMake(width,height/2 - pointDifferential)];
    // 终止点, 控制点.
    [rightPath addQuadCurveToPoint:CGPointMake(width, height-(height/2 - pointDifferential)) controlPoint:CGPointMake(width - pointMiddle/2, pointMiddle)];
    [rightPath bezierPathByReversingPath];
    [rightPath fill];
}

@end
