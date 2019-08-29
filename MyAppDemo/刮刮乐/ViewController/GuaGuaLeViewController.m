//
//  GuaGuaLeViewController.m
//  MyAppDemo
//
/*     刮奖原理
       分为两层  一层为奖项层 一层为刮奖层
       在实际生活中 刮奖层在上面  奖项层在下面
       在应用中 是奖项层在上面 刮奖层在下面  开始时奖项层的leyaer是透明的 所以看到下面的刮奖层
       当刮奖时 奖项层显示出来将刮奖层遮挡 感觉就像刮奖一样
*/
//  Created by yao on 2019/8/29.
//  Copyright © 2019 yao. All rights reserved.
//

#import "GuaGuaLeViewController.h"
#import "YTScratchyCard.h"
@interface GuaGuaLeViewController ()<YTScratchyCardDelegate>
@property (strong,nonatomic) YTScratchyCard *card;
@property (nonatomic, strong) UIButton *resetButton;
@end

@implementation GuaGuaLeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.card];
    [self.view addSubview:self.resetButton];
}
- (void)resetButtonClicked:(id)sender {
    [self.card resetView];
}
- (YTScratchyCard *)card{
    if (!_card) {
        _card = [[YTScratchyCard alloc]initWithFrame:CGRectMake(100, 100, 200, 200) delegate:self];
    }
    return _card;
}
- (UIButton *)resetButton{
    if (!_resetButton) {
        _resetButton = [[UIButton alloc] init];
        _resetButton.backgroundColor = [UIColor lightGrayColor];
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [_resetButton addTarget:self action:@selector(resetButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetButton;
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.card mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.card.mas_bottom).offset(50);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
    }];
    
   
}

#pragma mark delegate

- (void)didScratchPercentChanged:(float)percent{
    //如果刮了百分之70就认为刮完了, 全显示出来
    if(percent>0.7) {
        [self.card completeScratch];
    }
}
//返回覆刮开钱的视图
- (UIView *)coverViewWidthSuperSize:(CGSize)size{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,size.width , size.height)];
    label.backgroundColor =[ UIColor greenColor];
    label.text = @"刮出新天地";
    label.textColor = [UIColor redColor];
    label.textAlignment  =NSTextAlignmentCenter;
    return label;
}
//返回刮开后的视图
- (UIView *)prizeViewWidthSuperSize:(CGSize)size {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,size.width , size.height)];
    
    imageView.image = [UIImage imageNamed:@"刮刮乐.jpg"];
    return imageView;
}

@end
