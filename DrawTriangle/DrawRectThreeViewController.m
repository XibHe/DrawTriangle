//
//  DrawRectThreeViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/19.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawRectThreeViewController.h"

@interface DrawRectThreeViewController ()
@end

@implementation DrawRectThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawDrawTriangleView];
}

- (void)drawDrawTriangleView
{
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    
//    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);	// black
//    CGContextSetLineWidth(c, 2);
//    
//    CGMutablePathRef bubblePath = CGPathCreateMutable();
//    
//    // 这里的原点是point的尖尖
//    CGPathMoveToPoint(bubblePath, NULL, 145, 0);
//    
//    // 注意这里的X轴是默认给的_pointer的宽度，这个pointer是个正三角形，但是我们要个等腰的，所有X轴加上_pointer/2，Y轴加上_pointer，OK
//    CGPathAddLineToPoint(bubblePath, NULL, 145 + 6, 12);
//    
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
//    
//    // 这里也要改掉，不然自动关闭的时候就不是等腰三角形了
//    CGPathAddLineToPoint(bubblePath, NULL, 145 - 6, 12);
//    
//    
//    CGPathCloseSubpath(bubblePath);
//    
//    CGContextSaveGState(c);
//    CGContextAddPath(c, bubblePath);
//    CGContextClip(c);
    
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    CGRect rect = CGRectInset(self.view.bounds, 30, 30);
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect) + 64);
    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetHeight(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetHeight(rect) * 2 / 3);
    CGPathCloseSubpath(path);
    
    //绘制渐变
    [self drawLinearGradient:gc path:path startColor:[UIColor greenColor].CGColor endColor:[UIColor redColor].CGColor];
    
    //注意释放CGMutablePathRef
    CGPathRelease(path);
    
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
}


- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
