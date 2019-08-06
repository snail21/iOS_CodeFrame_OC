iOS OC 语言APP开发框架

cocopods 导入常用第三方框架有 ：

pod 'MBProgressHUD'
pod 'SDWebImage'
pod 'Masonry'
pod 'MJExtension'
pod 'IQKeyboardManager'
pod 'MJRefresh'
pod 'AFNetworking'


全局申明：
TQCommon.h  常用公有方法
TQNotifyConst.h 常用公有申明

分类常用：

NSTimer+HYBHelperKit.h  定时器使用
UIImage+Color.h  颜色转图片
UIImage+LXDCreateBarcode.h 二维码使用
UIView+Size.h
UIView+Extension.h  视图布局
UIView+HUD.h  提示语弹框
HWPopTool.h 中间视图弹框

请求基类：

TQ_Api.h  

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
*  POST 请求表单请求
*
*  @param path 请求路径
*  @param parameters 请求参数
*  @param res  回调结果
*/
- (void)requestAPPMenuPostWithPath:(NSString *)path
                                              paramStr:(NSDictionary *)parameters
                                                    result:(void(^)(BOOL success, NSString *msg, id responseObject))res;



/**
上传单张或多张图片到服务器

@param parameters 图片数组
@param res 回调
*/
- (void)uploadImagePlushWithImages:(NSDictionary *)parameters
                                                   result:(void(^)(BOOL success, NSString *msg, id responseObject))res;
