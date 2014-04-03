//
//  WSLoginManager.h
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSLoginTypedef.h"

@interface WSLoginQQManager : NSObject

/**
 *  @brief qq登陆单例
 *
 *  @return self
 */
+ (instancetype)sharedLoginQQManager;

/**
 *  @brief qq登录实例方法
 *
 *  @param completion 登录完成block
 */
- (void)loginWithCompletion:(LoginCompletionBlock)completion;
@end
