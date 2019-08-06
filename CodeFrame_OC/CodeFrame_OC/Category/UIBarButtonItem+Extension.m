//
//  UIBarButtonItem+Extension.m
//  彩宝宝
//
//  Created by xh on 15/6/8.
//  Copyright (c) 2015年 xh. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
//#import "FL_Button.h"


@implementation UIBarButtonItem (Extension)


/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮图片
 *
 *  @return 创建完成的item
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    //设置图片
//    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
//    //设置尺寸
//    CGSize  backsize = button.currentBackgroundImage.size;
//    CGRect backframe =CGRectMake(0, 0, backsize.width, backsize.height);
//    button.frame = backframe;
//    //添加监听事件
//    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 60, 64)];
    
   // button.backgroundColor = RandomColor;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    //设置图片
    //[button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    UIImageView *btnimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
    btnimage.contentMode = UIViewContentModeCenter;
    [button addSubview:btnimage];
    [btnimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button).offset(1);
        make.centerY.equalTo(button);
        make.size.mas_equalTo(CGSizeMake(15, 25));
    }];
    
   // [button setTitle:@"返回" forState:UIControlStateNormal];
    //设置尺寸
//    CGSize  backsize = button.currentBackgroundImage.size;
//    CGRect backframe =CGRectMake(0, 0, 60, backsize.height);
//    button.frame = backframe;
    
    
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    dictM[NSFontAttributeName] = button.titleLabel.font;
//    CGRect frame = [button.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
//    
    CGRect imageFrame = button.imageView.frame;
    
    imageFrame.origin.x = 0;
    
    
    CGRect titleFrame = button.titleLabel.frame;
    
    titleFrame.origin.x = CGRectGetWidth(imageFrame) + 15;
    
     //重写赋值frame
    button.titleLabel.frame = titleFrame;
    button.imageView.frame = CGRectMake(imageFrame.origin.x, imageFrame.origin.y, imageFrame.size.width - 5, imageFrame.size.height - 20);
    
    

    //添加监听事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    //barItem.width = -5;
    return barItem;
    
    
    
}



@end
