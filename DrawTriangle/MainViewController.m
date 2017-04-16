//
//  MainViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/16.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "MainViewController.h"

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
    
    _sourceArray = @[@"使用CAShapeLayer画三角形",@"结合CGPathAddLineToPoint画三角",@"结合CGPathAddArcToPoint画三角"];
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

@end
