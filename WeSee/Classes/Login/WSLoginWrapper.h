//
//  WSLoginWrapper.h
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSLoginQQManager.h"
#import "WSLoginTypedef.h"

@interface WSLoginWrapper : NSObject

/**
 *  @brief 对第三方登录进行封转
 *
 *  @param type       代表是qq还是sina登陆
 *  @param completion 返回登录状态
 */
+ (void)wrapperLoginWithType:(ThirdpartyLoginType)type completion:(LoginCompletionBlock)completion;
@end
