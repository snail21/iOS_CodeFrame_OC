//
//  TQ_Api.h
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    Post,
    Get,
    Put,
    Delete,
} requestType;

NS_ASSUME_NONNULL_BEGIN

@interface TQ_Api : NSObject

/**
 初始化请求基类
 
 @return 返回
 */
+ (TQ_Api *)sharedInstance;


/**
 *  APP 请求
 *
 *  @param path 请求路径
 *  @param type 请求类型
 *  @param param 请求参数
 *  @param res  回调结果
 */
- (void)requestAPPDataWithPath:(NSString *)path
                    requstType:(requestType)type
                   paramStr:(NSDictionary *)param
                     result:(void(^)(BOOL success, NSString *msg, id responseObject))res;


/**
 上传单张或多张图片到服务器
 
 @param parameters 图片数组
 @param res 回调
 */
- (void)uploadImagePlushWithImages:(NSDictionary *)parameters
                            result:(void(^)(BOOL success, NSString *msg, id responseObject))res;


/**
 *  POST 请求表单请求
 *
 *  @param path 请求路径
 *  @param parameters 请求参数
 *  @param res  回调结果
 */
- (void)requestAPPMenuPostWithPath:(NSString *)path
                         paramStr:(NSDictionary *)parameters
                           result:(void(^)(BOOL success, NSString *msg, id responseObject))res;


@end

NS_ASSUME_NONNULL_END
