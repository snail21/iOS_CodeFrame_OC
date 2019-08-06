//
//  UIBarButtonItem+Extension.h
//  彩宝宝
//
//  Created by xh on 15/6/8.
//  Copyright (c) 2015年 xh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)


+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
