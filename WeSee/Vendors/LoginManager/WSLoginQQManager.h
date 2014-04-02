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

+ (instancetype)sharedLoginQQManager;

- (void)loginWithCompletion:(LoginCompletionBlock)completion;
@end
