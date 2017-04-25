//
//  PopView.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/21.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "PopView.h"

@interface PopView ()
{
    CALayer      *_contentLayer;
    CAShapeLayer *_maskLayer;
}
@end

@implementation PopView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);	// black
    CGContextSetLineWidth(c, 2);
    CGMutablePathRef bubblePath = CGPathCreateMutable();
    
    // 初始点(这里的点是三角形的尖尖)
    CGPathMoveToPoint(bubblePath, NULL, screenWidth / 2, 0);
    // 三角形的一个边的点
    CGPathAddLineToPoint(bubblePath, NULL, screenWidth / 2 - 20, screenWidth * 24 / 375 / 2);
    // 左侧的连线
    CGPathAddLineToPoint(bubblePath, NULL, 0, screenWidth * 24 / 375 / 2);
    CGPathAddLineToPoint(bubblePath, NULL, 0, screenWidth * 84 / 375 / 2);
    // 右侧连线
    CGPathAddLineToPoint(bubblePath, NULL, screenWidth, screenWidth * 84 / 375 / 2);
    CGPathAddLineToPoint(bubblePath, NULL, screenWidth, screenWidth * 24 / 375 / 2);
    // 三角形的另一个边的点
    CGPathAddLineToPoint(bubblePath, NULL, screenWidth / 2 + 20, screenWidth * 24 / 375 / 2);
    
    CGPathCloseSubpath(bubblePath);
    CGContextSaveGState(c);
    CGContextAddPath(c, bubblePath);
    CGContextClip(c);
    // 设置填充色
    CGContextSetFillColorWithColor(c, [[UIColor blueColor] CGColor]);
    //CGContextSetStrokeColorWithColor(c, [[UIColor clearColor] CGColor]);
    CGContextFillRect(c, self.bounds);
    CGPathRelease(bubblePath);
}

@end
