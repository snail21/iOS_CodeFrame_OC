//
//  TQLoginModel.m
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import "TQLoginModel.h"

#define kPATH  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"TQAccount.archive"]

@implementation TQLoginModel


+ (instancetype)sharedModel
{
    static TQLoginModel *userModel = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        userModel = [[TQLoginModel alloc] init];
    });
    
    return userModel;
}


- (void)clearModel
{
    DLog(@"清除用户数据");
    TQLoginModel *model = [[TQLoginModel sharedModel] getAccount];
    model.nickname = nil;
    model.userid = nil;
    [NSKeyedArchiver archiveRootObject:model toFile:kPATH];
    
}

/**
 *  存储账号信息到沙盒
 *
 *  @param account 账号信息模型
 */
- (void)accountSave:(TQLoginModel *)account
{
    
    
    @try {
        
        if (account.nickname == nil) {
            
            DLog(@"空的用户数据，不保存");
        }else {
            
            //把模型数据写入沙盒
            [NSKeyedArchiver archiveRootObject:account toFile:kPATH];
        }
        
        
        
    }
    @catch (NSException *exception) {
        
        DLog(@"写入数据错误");
    }
    @finally {
        
        
    }
}


/**
 *  从沙盒中取出账号信息模型，并判断账号信息是否过期
 *
 *  @return  account ＝  账号信息模型， nil = 账号信息过期
 */
- (TQLoginModel *)getAccount
{
    
    @try {
        
        //#ifdef DEBUG
        //        if ([self is_file_exist:@"DuDuAccount.archive"]) {
        //
        //            DLog(@"存在文件DuDuAccount.archive");
        //        }
        //        else {
        //
        //            DLog(@"不存在文件DuDuAccount.archive");
        //        }
        //
        //#endif
        
        //获取沙盒路径
        TQLoginModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kPATH];
        
        return account;
    }
    @catch (NSException *exception) {
        
        DLog(@"读取用户信息出错");
    }
    @finally {
        
        
    }
    
    return [TQLoginModel sharedModel];
}



/**
 *  注意：要把对象存储在沙盒中必须实现此方法告诉沙盒，存储哪些数据
 *
 *  @param encoder 存储对象
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    //xh.modifly, 5.09
#warning 最新添加不确定科不科学，如有问题，可以恢复以前的代码
    //最新get到的方法， 利用runtime的方式 一次性解决
    
    unsigned int outCount = 0;
    Ivar *vars = class_copyIvarList([self class], &outCount);
    
    
    for (int i = 0; i < outCount; i++) {
        
        Ivar var = vars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithUTF8String:name];
        
        // 注意kvc的特性是，如果能找到key这个属性的setter方法，则调用setter方法
        // 如果找不到setter方法，则查找成员变量key或者成员变量_key，并且为其赋值
        // 所以这里不需要再另外处理成员变量名称的“_”前缀
        if ([key isEqualToString:@"_isLogin"] == NO) {
            
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
    
    
    
}


/**
 *  注意：读取对象沙盒中的数据，必须实现此方法，告诉沙盒要读取哪些数据
 *
 *  @param decoder 对象
 *
 *  @return 对象
 */
-(id)initWithCoder:(NSCoder *)decoder
{
    //原理同上
    if (self = [super init]) {
        
        unsigned int outCount = 0;
        Ivar *vars = class_copyIvarList([self class], &outCount);
        
        for (int i = 0; i < outCount; i++) {
            
            Ivar var = vars[i];
            const char *name = ivar_getName(var);
            NSString *key = [NSString stringWithUTF8String:name];
            
            if ([key isEqualToString:@"_isLogin"] == NO) {
                
                id value = [decoder decodeObjectForKey:key];
                [self setValue:value forKey:key];
            }
            
        }
        
    }
    
    return self;
    
}

@end
