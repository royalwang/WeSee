//
//  WSLoginTypedef.h
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#ifndef WeSee_WSLoginTypedef_h
#define WeSee_WSLoginTypedef_h

typedef NS_ENUM(NSUInteger, ThirdpartyLoginType) {
    ThirdpartyLoginType_QQ = 0,
    ThirdpartyLoginType_Sina
};

typedef NS_ENUM(NSUInteger, ThirdpartyLoginQQStatus) {
    ThirdpartyLoginQQStatus_Success = 100,//登录成功
    ThirdpartyLoginQQStatus_NotAccessToken,//未获取到accessToken
    ThirdpartyLoginQQStatus_UserCancel,//用户取消登录
    ThirdpartyLoginQQStatus_Fail,//登录失败
    ThirdpartyLoginQQStatus_NotNetwork,//无网络连接
};

typedef void(^LoginCompletionBlock)(id obj, NSUInteger status, NSError *error);

#endif
