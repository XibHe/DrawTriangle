//
//  DrawRectThreeViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/19.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawRectThreeViewController.h"
#import "PopView.h"

@interface DrawRectThreeViewController ()<UIGestureRecognizerDelegate>
{
    UIButton *_switchStatusBtn;
}
@property (nonatomic, strong) UIView  *coverView;
@property (nonatomic, strong) PopView *popView;
@end

@implementation DrawRectThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    // 弹出popView的按钮
    _switchStatusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_switchStatusBtn setTitle:@"点击" forState:UIControlStateNormal];
    [_switchStatusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_switchStatusBtn setFrame:CGRectMake(screenWidth / 4,screenHeight / 4,screenWidth / 2,40)];
    [_switchStatusBtn addTarget:self action:@selector(switchStatusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _switchStatusBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_switchStatusBtn];
}

#pragma mark - 初始化pop视图
- (UIView *)coverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.view.bounds];
        _coverView.hidden = YES;
        _coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        [[UIApplication sharedApplication].keyWindow addSubview:_coverView];
        
        // 
        _popView = [[PopView alloc] initWithFrame:CGRectMake(0, _switchStatusBtn.frame.origin.y + 40, screenWidth, screenWidth * 84 / 375 / 2)];
        [_coverView addSubview:_popView];
        __weak typeof(self) weakSelf = self;
        _popView.closePopViewBlock = ^{
            weakSelf.coverView.hidden = YES;
        };
        
        // 点击coverView的灰色区域，隐藏pop视图
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCover:)];
        tapGesture.delegate = self;
        [_coverView addGestureRecognizer:tapGesture];
    }
    return _coverView;
}

- (void)tapCover:(UITapGestureRecognizer *)recognizer
{
    if (_popView) {
        _popView.closePopViewBlock();
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
    if (CGRectContainsPoint(_popView.frame, point)){
        return NO;
    }
    return YES;
}

- (void)switchStatusBtnClick:(UIButton *)sender
{
    self.coverView.hidden = !self.coverView.hidden;
    self.popView.hidden = self.coverView.hidden;
}

@end
