//
//  MainViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/16.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "MainViewController.h"
#import "DrawRectOneViewController.h"
#import "DrawRectTwoViewController.h"
#import "DrawRectThreeViewController.h"
#import "DrawRectFourViewController.h"
#import "DrawRectFiveViewController.h"
#import "ArcToPointViewController.h"
#import "MaskImageViewController.h"
#import "ShapedImageViewController.h"
#import "PayMentHUDViewController.h"

static NSString *cellIndentify = @"cell";
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_sourceArray;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"比较不同的画图方式";
    
    _sourceArray = @[@"使用UIBezierPath绘制多边形",@"UIBezierPath+CAShapeLayer绘制多边形",@"CAShapeLayer设置Image",@"UIBezierPath绘制圆角Image",@"结合CGPathAddLineToPoint画三角",@"绘制带有箭头的矩形框",@"CGPathRef上绘制渐变颜色",@"结合CGPathAddArcToPoint绘制圆角矩形",@"结合CABasicAnimation做动画"];
    UITableView *listTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    listTableView.dataSource = self;
    listTableView.delegate = self;
    [self.view addSubview:listTableView];
    listTableView.rowHeight = 60;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify];
    }
    cell.textLabel.text = _sourceArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        DrawRectFourViewController *drawRectFourVC = [[DrawRectFourViewController alloc] init];
        [self.navigationController pushViewController:drawRectFourVC animated:YES];
    } else if (indexPath.row == 1) {
        DrawRectOneViewController *drawRectOneVC = [[DrawRectOneViewController alloc] init];
        [self.navigationController pushViewController:drawRectOneVC animated:YES];
    } else if (indexPath.row == 2) {
        ShapedImageViewController *shapedImageVC = [[ShapedImageViewController alloc] init];
        [self.navigationController pushViewController:shapedImageVC animated:YES];
    } else if (indexPath.row == 3) {
        MaskImageViewController *maskImageVC = [[MaskImageViewController alloc] init];
        [self.navigationController pushViewController:maskImageVC animated:YES];
    } else if (indexPath.row == 4) {
        DrawRectTwoViewController *drawRectTwoVC = [[DrawRectTwoViewController alloc] init];
        [self.navigationController pushViewController:drawRectTwoVC animated:YES];
    } else if (indexPath.row == 5) {
        DrawRectThreeViewController *drawRectThreeVC = [[DrawRectThreeViewController alloc] init];
        [self.navigationController pushViewController:drawRectThreeVC animated:YES];
    } else if (indexPath.row == 6) {
        DrawRectFiveViewController *drawRectFiveVC = [[DrawRectFiveViewController alloc] init];
        [self.navigationController pushViewController:drawRectFiveVC animated:YES];
    } else if (indexPath.row == 7) {
        ArcToPointViewController *arcToPointVC = [[ArcToPointViewController alloc] init];
        [self.navigationController pushViewController:arcToPointVC animated:YES];
    } else if (indexPath.row == 8) {
        PayMentHUDViewController *payMentHUDVC = [[PayMentHUDViewController alloc] init];
        [self.navigationController pushViewController:payMentHUDVC animated:YES];
    }
}
@end
