//
//  YiCheTableViewCell.m
//  MyAppDemo
//
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#import "YiCheTableViewCell.h"

@implementation YiCheTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageWidth.constant = K_SCREEN_WIDTH;
    self.imageHeight.constant = K_VIEWHEIGHTWITHXBOTTOM;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the view for the selected state
}

- (void)setContentWithImage:(UIImage *)image{
    self.contentImgageView.image = image;
}

@end
