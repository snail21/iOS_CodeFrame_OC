//
//  UIView+HUD.m
//  AFNetworking
//
//  Created by Arvin on 2018/10/13.
//

#import "UIView+HUD.h"
#import "MBProgressHUD.h"
//#import "NSBundle+JHBundle.h"

@implementation UIView (HUD)

- (void)jh_showLoadingWithText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = text;
}

- (void)jh_hide {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)jh_shwoSuccessWithText:(NSString *)text afterDelay:(NSTimeInterval)delay{
     NSTimeInterval realDelay = delay ? : 3.0;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"success"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.label.text = text ? : @"Operation Success";
    [hud hideAnimated:YES afterDelay:realDelay];
}

- (void)jh_showErrorWithText:(NSString *)text afterDelay:(NSTimeInterval)delay{
   NSTimeInterval realDelay = delay ? : 3.0;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = text ? : @"There is an Error...";
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"error"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    [hud hideAnimated:YES afterDelay:realDelay];
}

- (void)jh_showInfoWithText:(NSString *)text afterDelay:(NSTimeInterval)delay{
    NSTimeInterval realDelay = delay ? : 3.0;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"info"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:realDelay];
}




@end
