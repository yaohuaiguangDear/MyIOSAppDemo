//
//  ViewController.m
//  MyAppDemo
//
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#import "ViewController.h"
#import "YiCheTableViewController.h" //易车透视
#import "ScrollStringViewController.h"//字符串滚动
#import "RiLiViewController.h" //日历
#import "GuaGuaLeViewController.h"//刮刮乐
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObject:@"易车app创意广告,透明cell查看图片效果"];
        [_dataArray addObject:@"文字循环滚动，文字播报，文字动态，文字轮播"];
        [_dataArray addObject:@"日历"];
        [_dataArray addObject:@"刮刮乐"];
    }
    return _dataArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = self.dataArray[indexPath.row];
    if ([text isEqualToString:@"易车app创意广告,透明cell查看图片效果"]) {
        YiCheTableViewController *yiche = [[YiCheTableViewController alloc] init];
        [self.navigationController pushViewController:yiche animated:YES];
    }
    else if ([text isEqualToString:@"文字循环滚动，文字播报，文字动态，文字轮播"]) {
        ScrollStringViewController *scrollString = [[ScrollStringViewController alloc] init];
        [self.navigationController pushViewController:scrollString animated:YES];
    }
    else if ([text isEqualToString:@"日历"]) {
        RiLiViewController *rili = [[RiLiViewController alloc] init];
        [self.navigationController pushViewController:rili animated:YES];
    }
    else if ([text isEqualToString:@"刮刮乐"]) {
        GuaGuaLeViewController *vc = [[GuaGuaLeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
