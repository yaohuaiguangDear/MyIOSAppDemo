//
//  FunctionMacro.h
//  MyAppDemo
//
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#ifndef FunctionMacro_h
#define FunctionMacro_h
#define K_Image(imageName) ([UIImage imageNamed:imageName])

// weak
#define WeakSelf __weak typeof(self)weakSelf = self
#define StrongSelf __strong typeof(weakSelf)self = weakSelf
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
// RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define rgb(r,g,b) RGBA(r,g,b,1.0f)
#define rgba(r,g,b,a) RGBA(r,g,b,a)


#define KScienceTechnologyBlue  RGB(59,185,222)
#define kBackColor              RGB(9, 33, 62)
#define kVCBackColor            RGB(28, 42, 60)
#define kPicBackColor           RGB(0, 40, 90)

#endif /* FunctionMacro_h */
