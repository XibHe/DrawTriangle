//
//  DrawRectTwoViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/19.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawRectTwoViewController.h"
#import "DrawTriangleView.h"

@interface DrawRectTwoViewController ()

@end

@implementation DrawRectTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawTriangleView *drawTriangleView = [[DrawTriangleView alloc] initWithFrame:CGRectMake(screenWidth / 4, screenHeight / 4, screenWidth / 4, screenHeight / 4)];
    drawTriangleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:drawTriangleView];
}

@end
