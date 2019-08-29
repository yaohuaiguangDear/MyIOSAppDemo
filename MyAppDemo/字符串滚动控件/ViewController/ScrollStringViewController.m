//
//  ScrollStringViewController.m
//  MyAppDemo
//
//  Created by yao on 2019/8/29.
//  Copyright © 2019 yao. All rights reserved.
//

#import "ScrollStringViewController.h"

#import <LMJVerticalScrollText/LMJVerticalScrollText.h>

@interface ScrollStringViewController ()<LMJVerticalScrollTextDelegate>
//背景
@property (nonatomic, strong) UIScrollView *bgView;
@property (nonatomic, strong) UIButton *stopBtn;
@property (nonatomic, strong) UIButton *actionBtn1;
@property (nonatomic, strong) UIButton *actionBtn2;
@property (nonatomic, strong) UIButton *actionBtn3;
@property (nonatomic, strong) UIButton *actionBtn4;
//文字播报控件
@property (nonatomic, strong) LMJVerticalScrollText * verticalScrollText;
@end

@implementation ScrollStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.bgView];
    [self.bgView addSubview:self.verticalScrollText];
    [self.bgView addSubview:self.stopBtn];
    [self.bgView addSubview:self.actionBtn1];
    [self.bgView addSubview:self.actionBtn2];
    [self.bgView addSubview:self.actionBtn3];
    [self.bgView addSubview:self.actionBtn4];
    
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    [self.verticalScrollText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).with.offset(20);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    [self.stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.verticalScrollText.mas_right).with.offset(20);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(40);
    }];
    [self.actionBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).with.offset(20);
        make.top.mas_equalTo(180);
        make.right.mas_equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    [self.actionBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).with.offset(20);
        make.top.mas_equalTo(self.actionBtn1.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    [self.actionBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).with.offset(20);
        make.top.mas_equalTo(self.actionBtn2.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    [self.actionBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).with.offset(20);
        make.top.mas_equalTo(self.actionBtn3.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
}
- (UIScrollView *)bgView{
    if (!_bgView) {
        _bgView = [[UIScrollView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
- (UIButton *)stopBtn{
    if (!_stopBtn) {
        _stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_stopBtn setTitle:@"stop" forState:UIControlStateNormal];
        [_stopBtn setBackgroundColor:[UIColor redColor]];
        [_stopBtn setSelected:NO];
        [_stopBtn addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
        _stopBtn.layer.cornerRadius = 3;
    }
    return _stopBtn;
}
- (UIButton *)actionBtn1{
    if (!_actionBtn1) {
        _actionBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionBtn1 setTitle:@"Bottom to Top (NoSpace)--start" forState:UIControlStateNormal];
        [_actionBtn1 setBackgroundColor:[UIColor lightGrayColor]];
        [_actionBtn1 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        _actionBtn1.layer.cornerRadius = 3;
    }
    return _actionBtn1;
}
- (UIButton *)actionBtn2{
    if (!_actionBtn2) {
        _actionBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionBtn2 setTitle:@"Top to Bottom (NoSpace)--start" forState:UIControlStateNormal];
        [_actionBtn2 setBackgroundColor:[UIColor lightGrayColor]];
        [_actionBtn2 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        _actionBtn2.layer.cornerRadius = 3;
    }
    return _actionBtn2;
}
- (UIButton *)actionBtn3{
    if (!_actionBtn3) {
        _actionBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionBtn3 setTitle:@"Bottom to Top (Space)--start" forState:UIControlStateNormal];
        [_actionBtn3 setBackgroundColor:[UIColor lightGrayColor]];
        [_actionBtn3 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        _actionBtn3.layer.cornerRadius = 3;
    }
    return _actionBtn3;
}
- (UIButton *)actionBtn4{
    if (!_actionBtn4) {
        _actionBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionBtn4 setTitle:@"Top to Bottom (Space)--start" forState:UIControlStateNormal];
        [_actionBtn4 setBackgroundColor:[UIColor lightGrayColor]];
        [_actionBtn4 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        _actionBtn4.layer.cornerRadius = 3;
    }
    return _actionBtn4;
}
- (LMJVerticalScrollText *)verticalScrollText{
    if (!_verticalScrollText) {
        _verticalScrollText = [[LMJVerticalScrollText alloc] init];
        _verticalScrollText.delegate            = self;
        // 文字停留时间，默认为3s。
        _verticalScrollText.textStayTime        = 2;
        // 文字滚动动画时间，默认为1s。
        _verticalScrollText.scrollAnimationTime = 1;
        _verticalScrollText.backgroundColor     = [UIColor colorWithRed:64/255.f green:151/255.f blue:255/255.f alpha:0.5];
        _verticalScrollText.textColor           = [UIColor whiteColor];
        _verticalScrollText.textFont            = [UIFont boldSystemFontOfSize:15.f];
        _verticalScrollText.textAlignment       = NSTextAlignmentCenter;
        //是否可以点击文字
        _verticalScrollText.touchEnable         = YES;
        //播报内容
        _verticalScrollText.textDataArr         = [self getScrollTextData];
        _verticalScrollText.layer.cornerRadius  = 3;
    }
    
    return _verticalScrollText;
}
- (void)startAction:(UIButton *)button{
    //开始之前先停止
    [_verticalScrollText stop];
    if (button == self.actionBtn1) {
        [_verticalScrollText startScrollBottomToTopWithNoSpace];
        
    }else if (button == self.actionBtn2) {
        [_verticalScrollText startScrollTopToBottomWithNoSpace];
        
    }else if (button == self.actionBtn3) {
        [_verticalScrollText startScrollBottomToTopWithSpace];
        
    }else if (button == self.actionBtn4) {
        [_verticalScrollText startScrollTopToBottomWithSpace];
    }
    
}

- (void)stopAction:(UIButton *)button{
    [_verticalScrollText stop];
}
- (NSArray *)getScrollTextData{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是带图片的数据："];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"字符串流动图"];
    textAttachment.bounds = CGRectMake(0, -4, 15, 15);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attrStr insertAttributedString:attachmentAttrStr atIndex:attrStr.length];
    
    return @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",attrStr];
}

#pragma mark -- LMJVerticalScrollTextDelegate
//文字播报到第几个
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText currentTextIndex:(NSInteger)index{
    
}
//点击了第几个播报的文字
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText clickIndex:(NSInteger)index content:(NSString *)content{
    
}


@end
