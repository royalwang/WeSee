//
//  WSParseDataManager.h
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSParseDataManager : NSObject

+ (instancetype)sharedParseDataManager;

- (BOOL)isLogin;

//- (void)loginWithModel:()username Completion:(void (^)(BOOL success,NSError *error))completion;

@end
