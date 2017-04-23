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
    
    // 这里的点是三角形的尖尖
    CGPathMoveToPoint(bubblePath, NULL, self.frame.origin.x / 2, self.frame.origin.y);
    // 其中的一条边的终点
    CGPathAddLineToPoint(bubblePath, NULL, 0, self.frame.size.height / 3);
    // 另一条边的终点
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
