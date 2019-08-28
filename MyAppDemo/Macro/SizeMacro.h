//
//  SizeMacro.h
//  MyAppDemo
//
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#ifndef SizeMacro_h
#define SizeMacro_h

#define K_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define K_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//#define QP_STATUS_BAR_HEIGHT (isIphoneXDeviceLater ? 44.f : 20.f)
#define K_STATUS_BAR_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height) //用来修改启动热点下移的bug
#define isIphoneXDeviceLater ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom > 0.0) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})
// 导航栏高度
//#define QP_NAVIGATION_BAR_HEIGHT (isIphoneXDeviceLater ? 88.f : 64.f)
#define K_NAVIGATION_BAR_HEIGHT (K_STATUS_BAR_HEIGHT + 44) //用来修改启动热点下移的bug
// tabBar高度
#define K_TAB_BAR_HEIGHT (isIphoneXDeviceLater ? (49.f+34.f) : 49.f)
// home indicator
#define K_HOME_INDICATOR_HEIGHT (isIphoneXDeviceLater ? 34.f : 0.f)

//去掉导航栏和tabbar的高度
#define K_VIEW_HEIGHT ((K_SCREEN_HEIGHT) - (K_NAVIGATION_BAR_HEIGHT) - (K_TAB_BAR_HEIGHT))
//去掉导航栏和x的下部高度
#define K_VIEWHEIGHT ((K_SCREEN_HEIGHT) - (K_NAVIGATION_BAR_HEIGHT) - (K_HOME_INDICATOR_HEIGHT))
//去掉导航栏高度
#define K_VIEWHEIGHTWITHXBOTTOM ((K_SCREEN_HEIGHT) - (K_NAVIGATION_BAR_HEIGHT))

#endif /* SizeMacro_h */
