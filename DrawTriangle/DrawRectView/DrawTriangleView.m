//
//  DrawTriangleView.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/19.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawTriangleView.h"

@implementation DrawTriangleView

- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);	// black
    CGContextSetLineWidth(c, 1);
    
    CGMutablePathRef bubblePath = CGPathCreateMutable();
    
    // 这里的原点是point的尖尖
    CGPathMoveToPoint(bubblePath, NULL, self.frame.origin.x / 2, self.frame.origin.y);
    // 注意这里的X轴是默认给的_pointer的宽度，这个pointer是个正三角形，但是我们要个等腰的，所有X轴加上_pointer/2，Y轴加上_pointer，OK
    CGPathAddLineToPoint(bubblePath, NULL, 0, self.frame.size.height / 3);
    // 这里也要改掉，不然自动关闭的时候就不是等腰三角形了
    CGPathAddLineToPoint(bubblePath, NULL, self.frame.size.width, self.frame.size.height / 3);
    
    CGPathCloseSubpath(bubblePath);
    CGContextSaveGState(c);
    CGContextAddPath(c, bubblePath);
    CGContextClip(c);
    
    CGContextSetFillColorWithColor(c, [[UIColor blueColor] CGColor]);
    CGContextFillRect(c, self.bounds);
    CGPathRelease(bubblePath);
    
    
    // CGRectMake(screenWidth / 4, screenHeight / 4, screenWidth / 4, screenHeight / 4)
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextMoveToPoint(context, self.frame.origin.x / 2, 0);
//    CGContextAddLineToPoint(context, 0, self.frame.size.height / 2 - 20);
//    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height / 2 - 20);
//    
//    CGContextClosePath(context);
//    [[UIColor blackColor] setStroke];
//    [[UIColor redColor] setFill];
//    CGContextDrawPath(context, kCGPathFillStroke);
}
@end
