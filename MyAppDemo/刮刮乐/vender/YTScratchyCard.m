//
//  YTScratchyCard.m
//  YTScratchyCard
//
//  Created by soma on 2019/5/6.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import "YTScratchyCard.h"
#import "UIImage(Extension).h"
@interface YTScratchyCard()
//覆盖视图
@property (strong,nonatomic)UIView  *coverView;
//奖试图
@property (strong,nonatomic)UIView  *prizeView;


@property (strong,nonatomic)CAShapeLayer *maskLayer;
@property (strong,nonatomic)UIBezierPath *maskPath;

@end


@implementation YTScratchyCard

- (instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate{
    if(self == [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self initSubViews];
        [self configLayer];
    }
    return self;
}

- (void)initSubViews {
    /*
     在这里注意 一定要先添加刮奖前的视图 在添加刮奖后的视图
     实际上 刮奖前 奖项视图是在最上面的, 只不过layer层为透明 刮的时候讲刮的部分显示出来, 后面的就看不到了, 给出了像是显示出来刮的地方的视觉
     */
    
    
    //视图是从代理页面返回的
    [self addSubview:self.coverView];
    //视图是从代理页面返回的
    [self addSubview:self.prizeView];
}


- (void)configLayer{
    self.prizeView.layer.mask = self.maskLayer;
}



- (void)resetView {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    self.maskLayer.frame = CGRectZero;
    [self.maskPath removeAllPoints];
    self.maskLayer.path = self.maskPath.CGPath;
    self.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [CATransaction commit];
}

- (void)completeScratch {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    self.maskLayer.frame = self.prizeView.frame;
    [CATransaction commit];
    
    self.maskLayer.backgroundColor = [UIColor blueColor].CGColor;
}



- (UIImage *)scratchyImage {
    UIGraphicsBeginImageContextWithOptions(self.prizeView.bounds.size, NO, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.prizeView.layer renderInContext:ref];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint prePoint = [touch previousLocationInView:self.prizeView];
    CGPoint currentPoint = [touch locationInView:self.prizeView];
    [self.maskPath moveToPoint:prePoint];
    [self.maskPath addLineToPoint:currentPoint];
    self.maskLayer.path = self.maskPath.CGPath;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *image = [self scratchyImage];
    float cleaPercent =   [image caculateClearPercent];
    float scrachPercent = 1 - cleaPercent;
    
    if([self.delegate respondsToSelector:@selector(didScratchPercentChanged:)]) {
        [self.delegate didScratchPercentChanged:scrachPercent];
    }
}

- (UIBezierPath *)maskPath {
    if(!_maskPath) {
        _maskPath = [UIBezierPath bezierPath];
    }
    return _maskPath;
}

- (CAShapeLayer *)maskLayer{
    if(!_maskLayer) {
        _maskLayer = [CAShapeLayer layer];
        _maskLayer.lineCap = kCALineCapRound;
        _maskLayer.lineWidth = self.ScratchSize;
        _maskLayer.strokeColor = [UIColor blackColor].CGColor;
    }
    return _maskLayer;
}

- (CGFloat)ScratchSize{
    if(!_ScratchSize) {
        _ScratchSize = 30;
    }
    return _ScratchSize;
}

- (UIView *)prizeView{
    if(!_prizeView) {
        UIView *view = [UIView new];
        if([self.delegate respondsToSelector:@selector(prizeViewWidthSuperSize:)]){
            view = [self.delegate prizeViewWidthSuperSize:self.frame.size];
        }
        _prizeView = view;
    }
    return _prizeView;
}

- (UIView *)coverView{
    if(!_coverView) {
        UIView *view = [UIView new];
        if([self.delegate respondsToSelector:@selector(coverViewWidthSuperSize:)]){
            view = [self.delegate coverViewWidthSuperSize:self.frame.size];
        }
        _coverView = view;
    }
    return _coverView;
}



@end




