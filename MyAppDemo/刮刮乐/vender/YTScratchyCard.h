//
//  YTScratchyCard.h
//  YTScratchyCard
//
//  Created by soma on 2019/5/6.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YTScratchyCardDelegate <NSObject>
//返回刮奖前的视图
- (UIView *)coverViewWidthSuperSize:(CGSize)size;
//返回 刮奖后的视图
- (UIView *)prizeViewWidthSuperSize:(CGSize)size;

@optional
//刮奖视图比例
- (void)didScratchPercentChanged:(float)percent;
@end


@interface YTScratchyCard : UIView

//构造方法
- (instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;
//刮痕尺寸 默认30
@property (assign,nonatomic)CGFloat ScratchSize ;

//重置
- (void)resetView;

//刮完了！
- (void)completeScratch;

@property (weak,nonatomic)id<YTScratchyCardDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
