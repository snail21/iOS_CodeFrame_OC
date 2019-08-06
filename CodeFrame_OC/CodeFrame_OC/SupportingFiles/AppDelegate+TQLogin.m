//
//  AppDelegate+TQLogin.m
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import "AppDelegate+TQLogin.h"
#import "TQLoginVC.h"
#import "TQLoginModel.h"
#import "CYXTabBarController.h"
#import "CYXNavigationController.h"

@implementation AppDelegate (TQLogin)

- (void)tq_appLogining {
    
    
    // 设置顶部状态栏为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //这里应该注册通知，如果登陆成功以后，就发送通知在这里来处理
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(jumpToHomeVC)
                                                 name:notifyLogin
                                               object:nil];
    
    //退出登录
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginOut)
                                                 name:notifyLoginOut
                                               object:nil];
    
    
    
    //校验账号信息
    if ([TQLoginModel sharedModel].getAccount.nickname) {
        
        //    创建界面
        [self jumpToHomeVC];
        
    }else{
        
        [self jumpToLgoinVC];
    }
    
}


/**
 *  跳转到登陆页面
 */
- (void)jumpToLgoinVC
{
    
    TQLoginVC *vc = [[TQLoginVC alloc] init];
    CYXNavigationController *logVc = [[CYXNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = logVc;
    
    [self.window makeKeyAndVisible];
}


/**
 *  跳转到主控制器
 */
- (void)jumpToHomeVC
{
    // 初始化抽屉视图需要的控制器
    
    CYXTabBarController *dragVC = [[CYXTabBarController alloc]init];
    self.window.rootViewController = dragVC;
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    
//    CYXTabBarController *tabbar = [[CYXTabBarController alloc] init];
//
//    // 初始化导航控制器
////    CYXNavigationController *nav = [[CYXNavigationController alloc] initWithRootViewController:tabbar];
//
//    self.window.rootViewController = tabbar;
//
//    [self.window makeKeyAndVisible];
    
}

/**
 退出登录
 */
- (void)loginOut{
    
    //清除数据
    [[TQLoginModel sharedModel] clearModel];
    //跳转到登陆界面
    [self jumpToLgoinVC];
    
}



@end
