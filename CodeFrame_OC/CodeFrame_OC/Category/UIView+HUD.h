//
//  UIView+HUD.h
//  AFNetworking
//
//  Created by Arvin on 2018/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUD)

- (void)jh_hide;

- (void)jh_showLoadingWithText:(NSString *)text;

- (void)jh_shwoSuccessWithText:(NSString *)text afterDelay:(NSTimeInterval)delay;

- (void)jh_showErrorWithText:(NSString *)text afterDelay:(NSTimeInterval)delay;

- (void)jh_showInfoWithText:(NSString *)text afterDelay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
