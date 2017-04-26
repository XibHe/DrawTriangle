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
    
    CGRect frame = CGRectMake((CGRectGetWidth(self.view.bounds) - 100) / 2, (CGRectGetHeight(self.view.bounds) - 150) / 2, 100, 150);
    ShapedImageView *shapedImageView = [[ShapedImageView alloc] initWithFrame:frame];
    shapedImageView.image = [UIImage imageNamed:@"shapedImage"];
    [self.view addSubview:shapedImageView];
}

@end
