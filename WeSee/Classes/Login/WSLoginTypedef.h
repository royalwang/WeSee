//
//  WSLoginTypedef.h
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#ifndef WeSee_WSLoginTypedef_h
#define WeSee_WSLoginTypedef_h

/**
 *  第三方登录类型参数
 */
typedef NS_ENUM(NSUInteger, ThirdpartyLoginType) {
    /**
     *  使用QQ登陆
     */
    ThirdpartyLoginType_QQ = 0,
    /**
     *  使用sina登陆
     */
    ThirdpartyLoginType_Sina
};


/**
 *  QQ登陆状态码
 */
typedef NS_ENUM(NSUInteger, ThirdpartyLoginQQStatus) {
    /**
     *  登录成功
     */
    ThirdpartyLoginQQStatus_Success = 100,
    /**
     *  未获取到accessToken
     */
    ThirdpartyLoginQQStatus_NotAccessToken,
    /**
     *  用户取消登录
     */
    ThirdpartyLoginQQStatus_UserCancel,
    /**
     *  登录失败
     */
    ThirdpartyLoginQQStatus_Fail,
    /**
     *  无网络连接
     */
    ThirdpartyLoginQQStatus_NotNetwork,
};

/**
 *  第三方登录完成block
 *
 *  @param obj    包含第三方登录信息的对象
 *  @param status 状态码
 *  @param error  error
 */
typedef void(^LoginCompletionBlock)(id obj, NSUInteger status, NSError *error);

#endif
