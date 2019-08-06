//
//  AppDelegate.m
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/5.
//  Copyright © 2019 何太强. All rights reserved.
//

#import "AppDelegate.h"
#import "XTGuidePagesViewController.h"
#import "AppDelegate+TQLogin.h"

@interface AppDelegate ()<selectDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *images = @[@"yindaoye_1_img", @"yindaoye_2_img", @"yindaoye_3_img", @"yindaoye_4_img"];
    BOOL y = [XTGuidePagesViewController isShow];
    if (y) {
        XTGuidePagesViewController *xt = [[XTGuidePagesViewController alloc] init];
        self.window.rootViewController = xt;
        xt.delegate = self;
        [xt guidePageControllerWithImages:images];
        [self.window makeKeyAndVisible];
    }
    else {
        //登录APP
        [self tq_appLogining];
        
    }
    
    return YES;
}

-(void)click
{
    //登录APP
    [self tq_appLogining];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
