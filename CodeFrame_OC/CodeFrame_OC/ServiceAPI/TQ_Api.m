//
//  TQ_Api.m
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import "TQ_Api.h"
#import "AFNetworking.h"

NSString *const kHttpBaseUrl = @"http://sz.wisdudu.com";

static AFHTTPSessionManager *shareClient;
static TQ_Api *api;

@implementation TQ_Api

/**
 请求管理单例
 
 @return 类对象
 */
+ (TQ_Api *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        api = [[TQ_Api alloc] init];
        shareClient = [AFHTTPSessionManager manager];
        
        //设置超时时间
        [shareClient.requestSerializer setTimeoutInterval:15.0f];
        //应该是不需要缓存每次都重新请求
        [shareClient.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        //请求处理
        shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                                 @"text/html",
                                                                 @"application/json",
                                                                 @"text/javascript",
                                                                 @"text/json",
                                                                 @"text/plain",
                                                                 nil];
        shareClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        shareClient.requestSerializer=[AFHTTPRequestSerializer serializer];
    });
    return api;
}


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
                        result:(void(^)(BOOL success, NSString *msg, id responseObject))res {
    
    NSString *tmpPath = [NSString stringWithFormat:@"%@%@", kHttpBaseUrl, path];
    
    switch (type) {
        case Post:
        {
            [shareClient POST:tmpPath parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSData *strData = responseObject;
                NSError *error;
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:&error];
                
                if (dictionary) {
                    
                    NSString *return_msg=[dictionary objectForKey:@"msg"];
                    NSString *return_num = [dictionary objectForKey:@"code"];
                    if (return_num.intValue == 0) {
                        
                        NSDictionary *result=[dictionary objectForKey:@"data"];
                        
                        res(YES, return_msg, result);
                    }
                    else
                    {
                       
                       res(NO, return_msg, nil);
                    }
                }
                else {
                    
                    res(NO, error.domain, nil);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
                res(NO, @"网络错误/其它", nil);
            }];
        }
            break;
        case Get:
        {
            [shareClient GET:tmpPath parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSData *strData = responseObject;
//                NSString *str = [[NSString alloc] initWithData:strData encoding: NSUTF8StringEncoding];
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil];
                
                if (dictionary) {
                    
                    NSString *return_msg=[dictionary objectForKey:@"msg"];
                    NSString *return_num = [dictionary objectForKey:@"code"];
                    if (return_num.intValue == 0) {
                        
                        NSDictionary *result=[dictionary objectForKey:@"content"];
                        
                        res(YES, return_msg, result);
                    }
                    else
                    {
                        res(NO, return_msg, nil);
                    }
                }
                else {
                    
                    res(NO, @"网络错误/其它", nil);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                res(NO, @"网络错误/其它", nil);
            }];
        }
            break;
        case Put:
        {
            [shareClient PUT:tmpPath parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSData *strData = responseObject;
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil];
                
                if (dictionary) {
                    
                    NSString *return_msg=[dictionary objectForKey:@"msg"];
                    NSString *return_num = [dictionary objectForKey:@"code"];
                    if (return_num.intValue == 0) {
                        
                        NSDictionary *result=[dictionary objectForKey:@"content"];
                        
                        res(YES, return_msg, result);
                    }
                    else
                    {
                        res(NO, return_msg, nil);
                    }
                }
                else {
                    
                    res(NO, @"网络错误/其它", nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                res(NO, @"网络错误/其它", nil);
            }];
        }
            break;
        case Delete:
        {
            [shareClient DELETE:tmpPath parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSData *strData = responseObject;
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil];
                
                if (dictionary) {
                    
                    NSString *return_msg=[dictionary objectForKey:@"msg"];
                    NSString *return_num = [dictionary objectForKey:@"code"];
                    if (return_num.intValue == 0) {
                        
                        NSDictionary *result=[dictionary objectForKey:@"content"];
                        
                        res(YES, return_msg, result);
                    }
                    else
                    {
                        res(NO, return_msg, nil);
                    }
                }
                else {
                    
                    res(NO, @"网络错误/其它", nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               
                res(NO, @"网络错误/其它", nil);
            }];
        }
            break;
            
        default:
            break;
    }
    
}


/**
 上传单张或多张图片到服务器
 
 @param parameters 图片数组
 @param res 回调
 */
- (void)uploadImagePlushWithImages:(NSDictionary *)parameters
                            result:(void(^)(BOOL success, NSString *msg, id responseObject))res {
    
    
    AFHTTPSessionManager *manger = shareClient;
    
    // 设置允许同时最大并发数量，过大容易出问题
    manger.operationQueue.maxConcurrentOperationCount = 9;
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                             @"text/html",
                                                                             @"text/json",
                                                                             @"text/plain",
                                                                             @"text/javascript",
                                                                             @"text/xml",
                                                                             @"image/*"]];
    
    [manger POST:@"http://test.api.v1.317youxi.com/sdk/player/edit-head" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSMutableArray *dictTitleAry = [NSMutableArray arrayWithArray:parameters.allKeys];
        for (int i = 0; i < dictTitleAry.count; i ++) {
            
            NSString *keyStr = dictTitleAry[i];
            
            if ([keyStr isEqualToString:@"headimgurl"]) {
                
                UIImage *image = [parameters[keyStr] firstObject];
                
                NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
                //NSData *imageData = UIImagePNGRepresentation(image);
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                //设置时间格式
                formatter.dateFormat = @"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                NSString *fileName = [NSString stringWithFormat:@"%@%d.jpg", str,i];
                
                
                [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"headimgurl"] fileName:fileName mimeType:@"jpg"];
            }
            else {
                NSString *valueStr = parameters[keyStr];
                [formData appendPartWithFormData:[valueStr dataUsingEncoding:NSUTF8StringEncoding] name:keyStr];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *strData = responseObject;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil];
        
        if (dictionary) {
            
            NSString *return_msg=[dictionary objectForKey:@"msg"];
            NSString *return_num = [dictionary objectForKey:@"code"];
            if (return_num.intValue == 0) {
                
                NSDictionary *result=[dictionary objectForKey:@"data"];
                
                res(YES, return_msg, result);
            }
            else
            {
                res(NO, return_msg, nil);
            }
        }
        else {
            
            res(NO, @"网络错误/其它", nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        res(NO, @"网络错误/其它", nil);
    }];
    
}


/**
 *  POST 请求表单请求
 *
 *  @param path 请求路径
 *  @param parameters 请求参数
 *  @param res  回调结果
 */
- (void)requestAPPMenuPostWithPath:(NSString *)path
                          paramStr:(NSDictionary *)parameters
                            result:(void(^)(BOOL success, NSString *msg, id responseObject))res {
    
    NSString *tmpPath = [NSString stringWithFormat:@"%@%@", kHttpBaseUrl, path];
    
    
    NSMutableDictionary *paramet = [NSMutableDictionary dictionaryWithDictionary:parameters];
    //    [paramet setObject:[[UIDevice currentDevice] name] forKey:@"device_name"];
    //    [paramet setObject:@"iOS" forKey:@"device_os"];
    //    [paramet setObject:[[UIDevice currentDevice] systemVersion] forKey:@"device_os_version"];
    //    [paramet setObject:[[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"] forKey:@"app_version"];
    //配置AF
    AFHTTPSessionManager *manage = shareClient;
    
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    
    [manage POST:tmpPath parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSMutableArray *dictTitleAry = [NSMutableArray arrayWithArray:paramet.allKeys];
        for (int i = 0; i < dictTitleAry.count; i ++) {
            
            NSString *keyStr = dictTitleAry[i];
            NSString *valueStr = paramet[keyStr];
            [formData appendPartWithFormData:[valueStr dataUsingEncoding:NSUTF8StringEncoding] name:keyStr];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *strData = responseObject;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableContainers error:nil];
        
        if (dictionary) {
            
            NSString *return_msg=[dictionary objectForKey:@"msg"];
            NSString *return_num = [dictionary objectForKey:@"code"];
            if (return_num.intValue == 200) {
                
                NSDictionary *result= [dictionary objectForKey:@"data"];
                
                res(YES, return_msg, result);
            }
            else
            {
                res(NO, return_msg, nil);
            }
        }
        else {
            
            res(NO, @"网络错误/其它", nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        res(NO, @"网络错误/其它", nil);
    }];
    
}



@end
