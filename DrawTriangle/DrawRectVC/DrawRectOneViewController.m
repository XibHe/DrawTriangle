//
//  DrawRectOneViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/19.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawRectOneViewController.h"

@interface DrawRectOneViewController ()
{
    UIView *_triangleView;
}
@end

@implementation DrawRectOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _triangleView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth / 4, 200, screenWidth / 2, screenHeight / 2)];
    _triangleView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_triangleView];
    
    _triangleView.layer.mask = [self createMaskLayerWithView];
}

- (CALayer *)createMaskLayerWithView
{
    CGFloat viewWidth = CGRectGetWidth(_triangleView.frame);
    CGFloat viewHeight = CGRectGetHeight(_triangleView.frame);

    CGFloat rightSpace = 10.;
    CGFloat topSpace = 15.;

    // 起点
    CGPoint point1 = CGPointMake(0, 0);
    
    // 绘制线条
    CGPoint point2 = CGPointMake(viewWidth-rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWidth-rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWidth, topSpace);
    CGPoint point5 = CGPointMake(viewWidth-rightSpace, topSpace+10.);
    CGPoint point6 = CGPointMake(viewWidth-rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;

    return layer;
}

@end
