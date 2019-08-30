//
//  ShengBoViewController.m
//  MyAppDemo
//  https://github.com/xjh093/JHSoundWaveView
//  Created by yao on 2019/8/30.
//  Copyright © 2019 yao. All rights reserved.
//

#import "ShengBoViewController.h"
#import "JHSoundWaveView.h"
@interface ShengBoViewController ()

@end

@implementation ShengBoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    JHSoundWaveConfig *config = [[JHSoundWaveConfig alloc] init];
    /// 个数,默认3  竖条的个数
    config.count = 36;
    /// 宽度,默认2 单个竖条的宽度
    config.width = 2;
    /// 左边距,默认0
    config.leftMargin = 0;
    /// 间距,默认2
    config.space = 5;
    /// 颜色,whiteColor 竖条的颜色
    config.color = [UIColor whiteColor];
    //这里的宽度不起作用 是根据上面的配置算的 高度就是竖线s的高度
    JHSoundWaveView *view = [[JHSoundWaveView alloc] initWithFrame:CGRectMake(100, 300, 0, 20) config:config];
    [view startAnimation];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
