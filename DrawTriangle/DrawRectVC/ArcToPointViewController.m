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
    [self drawArcToPoint];
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
    CGPathAddArcToPoint(path, &transform, 200, 0, 200, 200, radius);
    //右下角和左下角两个点，画出另外半个圆角
    CGPathAddArcToPoint(path, &transform, 200, 200, 0, 200, radius);
    //CGPathAddArcToPoint会在交点中停止，所以需要再次调用CGPathAddLineToPoint画出下面的线
    CGPathAddLineToPoint(path, &transform, 0, 200);
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

@end
