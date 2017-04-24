//
//  DrawRectFourViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/24.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "DrawRectFourViewController.h"
#import "DrawPolygonView.h"

@interface DrawRectFourViewController ()

@end

@implementation DrawRectFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    DrawPolygonView *drawPolygonView = [[DrawPolygonView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight)];
    [self.view addSubview:drawPolygonView];
}

@end
