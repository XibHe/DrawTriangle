//
//  ArcToPointViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/25.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "ArcToPointViewController.h"

@interface ArcToPointViewController ()

@end

@implementation ArcToPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    // 绘制右侧为圆角的矩形
    [self drawArcToPoint];
    // 绘制四角为圆角的矩形
    [self drawArcToPoint2];
}

- (void)drawArcToPoint
{
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    //=== 绘画逻辑 ===
    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 100);
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    //半径为30
    CGFloat radius = 30;
    //初始点为(0, 0)
    CGPathMoveToPoint(path, &transform, 0, 0);
    //右上角和右下角两个点，画出半个圆角
    CGPathAddArcToPoint(path, &transform, 100, 0, 100, 100, radius);
    //右下角和左下角两个点，画出另外半个圆角
    CGPathAddArcToPoint(path, &transform, 100, 100, 0, 100, radius);
    //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
    CGPathAddLineToPoint(path, &transform, 0, 100);
    //将CGMutablePathRef添加到当前Context内
    CGContextAddPath(gc, path);
    [[UIColor grayColor] setFill];
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    //执行绘画
    CGContextDrawPath(gc, kCGPathFillStroke);
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
}

- (void)drawArcToPoint2
{
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //===绘画逻辑 ===
    //创建用于转移坐标的Transform,如许我们不消遵守实际显示做坐标策画
    CGAffineTransform transform = CGAffineTransformMakeTranslation(200,200);
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    //半径为10
    CGFloat radius = 10;
    
    //初始点为(10, 0),起点要从10开始，否则，在左上角会出现线条
    CGPathMoveToPoint(path, &transform, 10, 0);
    //右上角和右下角两个点,画出半个圆角
    CGPathAddArcToPoint(path, &transform,200, 0, 200, 200, radius);
    //右下角,画出别的半个圆角
    CGPathAddArcToPoint(path, &transform,200, 200, 0, 200, radius);
    //左下角
    CGPathAddArcToPoint(path, &transform,0, 200, 0,0, radius);
    //左上角
    CGPathAddArcToPoint(path, &transform,0, 0, 200, 0, radius);
    
    //将CGMutablePathRef添加到当前Context内
    CGContextAddPath(gc, path);
    [[UIColor grayColor] setFill];
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc,2);
    
    //履行绘画
    CGContextDrawPath(gc,kCGPathFillStroke);
    //从Context中获取图像,并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
}

@end
