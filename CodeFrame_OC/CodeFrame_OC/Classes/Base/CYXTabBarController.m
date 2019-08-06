//
//  CYXTabBarController.m
//   
//
//  Created by Macx on 15/9/4.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "CYXTabBarController.h"
#import "CYXNavigationController.h"


@interface CYXTabBarController ()

@end

@implementation CYXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
    
}

/**
 *  添加所有子控制器
 */
- (void)setUpAllChildViewController{
    // 1.添加第一个控制器
    UIViewController *oneVC = [[UIViewController alloc]init];
    oneVC.view.backgroundColor = UIColor.whiteColor;
    [self setUpOneChildViewController:oneVC image:[UIImage imageNamed:@"home_normal_img"] selectImage:[UIImage imageNamed:@"home_select_img"] title:@"首页"];
    
    // 2.添加第2个控制器
//    CallCenterVC *towVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"CallCenterVC"];
     UIViewController *towVC = [[UIViewController alloc]init];
    towVC.view.backgroundColor = UIColor.whiteColor;
    [self setUpOneChildViewController:towVC image:[UIImage imageNamed:@"customer_normal_img"] selectImage:[UIImage imageNamed:@"customer_select_img"] title:@"消息"];

    // 3.添加第3个控制器
//    MineInfoVC *threeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MineInfoVC"];
     UIViewController *threeVC = [[UIViewController alloc]init];
    threeVC.view.backgroundColor= UIColor.whiteColor;
    [self setUpOneChildViewController:threeVC image:[UIImage imageNamed:@"mine_normal_img"] selectImage:[UIImage imageNamed:@"mine_select_img"] title:@"我的"];
}


/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectImage:(UIImage *)selectImg title:(NSString *)title{
    
    CYXNavigationController *navC = [[CYXNavigationController alloc]initWithRootViewController:viewController];
    navC.tabBarItem.title = title;
    navC.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [navC.tabBarItem setSelectedImage:[selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [navC.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xCE0B0B) size:CGSizeMake(kScreenWidth, 64)] forBarMetrics:UIBarMetricsDefault];
    navC.navigationBar.translucent = NO;
//    navC.navigationBar.tintColor = UIColor.whiteColor;
    viewController.navigationItem.title = title;
    [self unSelectedTapTabBarItems:navC.tabBarItem];
    [self selectedTapTabBarItems:navC.tabBarItem];
    
    [self addChildViewController:navC];
}

-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], NSFontAttributeName,UIColorFromHex(0xBEBEBE),NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
    
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        NSFontAttributeName,UIColorFromHex(0xCE0B0B),NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}





@end
