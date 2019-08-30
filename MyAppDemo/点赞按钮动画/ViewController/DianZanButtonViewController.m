//
//  DianZanButtonViewController.m
//  MyAppDemo
//
//  Created by yao on 2019/8/30.
//  Copyright © 2019 yao. All rights reserved.
//

#import "DianZanButtonViewController.h"
#import "JHLikeButton.h"
@interface DianZanButtonViewController ()
//五角星形状
@property (nonatomic, strong) JHLikeButton *likeButton;
//心形形状
@property (nonatomic, strong) JHLikeButton *heartButton;
@end

@implementation DianZanButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.likeButton.clickBlock = ^(BOOL like) {
        if (like) {
            NSLog(@"yes");
        }else{
            NSLog(@"no");
        }
    };
    self.heartButton.clickBlock = ^(BOOL like) {
        if (like) {
            NSLog(@"yes");
        }else{
            NSLog(@"no");
        }
    };
    // Do any additional setup after loading the view.
    [self.view addSubview:self.likeButton];
    [self.view addSubview:self.heartButton];
}

- (JHLikeButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [[JHLikeButton alloc] initWithFrame:CGRectMake(150, 200, 40, 40)];
        _likeButton.type = JHLikeButtonType_Star;
        [_likeButton prepare];
    }
    return _likeButton;
}

- (JHLikeButton *)heartButton{
    if (!_heartButton) {
        _heartButton = [[JHLikeButton alloc] initWithFrame:CGRectMake(150, 280, 40, 40)];
        _heartButton.type = JHLikeButtonType_Heart;
        [_heartButton prepare];
    }
    return _heartButton;
}

@end
