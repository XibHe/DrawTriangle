//
//  PopView.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/21.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "PopView.h"

@implementation PopView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        //CGRectMake(0, 64, screenWidth, screenWidth * 84 / 375 / 2)
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);	// black
    CGContextSetLineWidth(c, 2);
    
    CGMutablePathRef bubblePath = CGPathCreateMutable();
    
    // 这里的原点是point的尖尖
    CGPathMoveToPoint(bubblePath, NULL, screenWidth / 2, 0);
    
    // 注意这里的X轴是默认给的_pointer的宽度，这个pointer是个正三角形，但是我们要个等腰的，所有X轴加上_pointer/2，Y轴加上_pointer，OK
    CGPathAddLineToPoint(bubblePath, NULL, screenWidth / 2 - 20, 24);
    
    // CGRect bubbleRect = CGRectMake(0, 12, 285, 62);
    
//    CGPathAddArcToPoint(bubblePath, NULL,
//                        287, 62,
//                        287, 12 + 5,
//                        5);
//    
//    CGPathAddArcToPoint(bubblePath, NULL,
//                        287, 74,
//                        287 - 5, 74,
//                        5);
//    
//    CGPathAddArcToPoint(bubblePath, NULL,
//                        2, 74,
//                        2, 74 - 5,
//                        5);
//    
//    CGPathAddArcToPoint(bubblePath, NULL,
//                        2, 12,
//                        2 + 5, 12,
//                        5);
    
    CGPathAddArcToPoint(bubblePath, nil, CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds), 5);
    //2.顶部中点为p2，右上角为p3，右边中点为p4，连接p2p3与p3p4则在两条直线相交处绘制弧度为r的圆角。
    CGPathAddArcToPoint(bubblePath, nil, CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds), 5);
    CGPathAddArcToPoint(bubblePath, nil, CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds), 5);
    CGPathAddArcToPoint(bubblePath, nil, CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds), CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds), 5);
    
    // 这里也要改掉，不然自动关闭的时候就不是等腰三角形了
    CGPathAddLineToPoint(bubblePath, NULL,  screenWidth / 2 + 20, 24);
    
    
    CGPathCloseSubpath(bubblePath);
    
    CGContextSaveGState(c);
    CGContextAddPath(c, bubblePath);
    CGContextClip(c);
}

@end
