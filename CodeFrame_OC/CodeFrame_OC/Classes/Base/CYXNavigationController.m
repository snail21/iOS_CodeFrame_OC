//
//  CYXNavigationController.m
//   
//
//  Created by Macx on 15/9/4.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "CYXNavigationController.h"

@interface CYXNavigationController ()

@end

@implementation CYXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance].barTintColor = UIColorFromHex(0xCE0B0B);
    [UINavigationBar appearance].tintColor = UIColor.whiteColor;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xCE0B0B) size:CGSizeMake(kScreenWidth, TQ_TopHeight)]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    //1. 判断是子控制器还是跟控制器
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *buttonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"nav_back" highImage:@"nav_back"];
        if ([UIDevice currentDevice].systemVersion.floatValue > 7.0) {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            negativeSpacer.width = -10;
            
            viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, buttonItem];
            
        }else{
            
            viewController.navigationItem.leftBarButtonItem = buttonItem;
            
        }
    }
    //    if (self.childViewControllers.count > 0) {
    //
    //        /* 自动显示和隐藏tabbar */
    //        viewController.hidesBottomBarWhenPushed = YES;
    //
    //    }
    
    [super pushViewController:viewController animated:animated];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

/**
 *  返回上一级控制器
 */
-(void)back
{
    //防止有时候退出 没有关掉提示框
    //    [SVProgressHUD dismiss];
    
    [self popViewControllerAnimated:YES];
    
}

@end
