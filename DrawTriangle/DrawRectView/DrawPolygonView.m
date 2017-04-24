//
//  DrawPolygonView.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/24.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawPolygonView.h"

@implementation DrawPolygonView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor colorWithRed:0 green:0.7 blue:0 alpha:1];
    [color set];
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    
    // 起点
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // 绘制线条
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    //根据坐标点连线
    [aPath stroke];
    [aPath fill];
}

@end
