//
//  YiCheTableViewCell.h
//  MyAppDemo
//
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YiCheTableViewCell : UITableViewCell
/**
 设置图片宽度
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;
/**
 图片高度
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet UIImageView *contentImgageView;
/**
 scrollView滑动时显示
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)setContentWithImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
