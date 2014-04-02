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

+ (void)wrapperLoginWithType:(ThirdpartyLoginType)type completion:(LoginCompletionBlock)completion;
@end
