//
//  ShapedImageView.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/26.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "ShapedImageView.h"

@interface ShapedImageView ()
{
    CALayer      *_contentLayer;
    CAShapeLayer *_maskLayer;
}
@end

@implementation ShapedImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
//        [self setupSubViews];
    }
    return self;
}

- (void)setup
{
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor clearColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.1, 0.1, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;                 //非常关键设置自动拉伸的效果且不变形
    _maskLayer.contents = (id)[UIImage imageNamed:@"pop"].CGImage;
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    _contentLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"popBack"].CGImage);
    [self.layer addSublayer:_contentLayer];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(4, 4, 300, 30)];
    title.font = [UIFont systemFontOfSize:12];
    title.text = @"消息中心可联系销售或客服，可查看物流促销等信息";
    [self addSubview:title];
}

- (void)setupSubViews {
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor clearColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;                 //非常关键设置自动拉伸的效果且不变形
    _maskLayer.contents = (id)[UIImage imageNamed:@"gray_bubble_right"].CGImage;
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    _contentLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"shapedImage"].CGImage);
    [self.layer addSublayer:_contentLayer];
}

@end
