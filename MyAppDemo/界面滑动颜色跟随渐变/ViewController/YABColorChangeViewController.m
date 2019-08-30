//
//  YABColorChangeViewController.m
//  MyAppDemo
//
//  Created by yao on 2019/8/30.
//  Copyright © 2019 yao. All rights reserved.
//

#import "YABColorChangeViewController.h"
#import "YABColorChangeView.h"
@interface YABColorChangeViewController ()
@property (nonatomic, strong) YABColorChangeView *colorChangeView;
@end

@implementation YABColorChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.colorChangeView];
    // Do any additional setup after loading the view.
}

- (YABColorChangeView *)colorChangeView{
    if (!_colorChangeView) {
        _colorChangeView = [[YABColorChangeView alloc] initWithFrame:self.view.bounds];
    }
    return _colorChangeView;
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
   
    
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
