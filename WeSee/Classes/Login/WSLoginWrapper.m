//
//  WSLoginWrapper.m
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSLoginWrapper.h"

@implementation WSLoginWrapper

+ (void)wrapperLoginWithType:(ThirdpartyLoginType)type completion:(LoginCompletionBlock)completion
{
    switch (type) {
        case ThirdpartyLoginType_QQ:
        {
            [[WSLoginQQManager sharedLoginQQManager] loginWithCompletion:completion];
        }
            break;
        case ThirdpartyLoginType_Sina:
        {
            
        }
            
        default:
            break;
    }
}
@end
