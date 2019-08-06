//
//  TQLoginModel.h
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TQLoginModel : NSObject

/** token */
@property (nonatomic, strong) NSString *token;

/** 用户昵称 */
@property (nonatomic, strong) NSString *nickname;

/** 用户所在市 */
@property (nonatomic, strong) NSString *userid;

/** socket 消息地址 */
@property (nonatomic, strong) NSString *url;



/** 初始化用户模型单例 */
+ (instancetype)sharedModel;

/** 从归档文件中获取用户模型 */
- (TQLoginModel *)getAccount;

/** 存储用户模型到归档 */
- (void)accountSave:(TQLoginModel *)account;


/** 清除用户数据 */
- (void)clearModel;

@end

NS_ASSUME_NONNULL_END
