//
//  ShapedImageViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/26.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "ShapedImageViewController.h"
#import "ShapedImageView.h"

@interface ShapedImageViewController ()
@end

@implementation ShapedImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = CGRectMake(10, (CGRectGetHeight(self.view.bounds) - 150) / 2, 320, 34);
    ShapedImageView *shapedImageView = [[ShapedImageView alloc] initWithFrame:frame];
    [self.view addSubview:shapedImageView];
}

@end
