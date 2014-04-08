//
//  WSGlobalManager.h
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSUserModel.h"

@interface WSGlobalManager : NSObject

@property (nonatomic, strong) WSUserModel *userInfo;

+ (instancetype)sharedManager;

/**
 *  设置全局的userinfo值
 *
 *  @param dict 包含user信息的字典
 */
- (void)setUserInfoWithDict:(NSDictionary*)dict;

/**
 *  将本地userdefaults中存储的用户信息复制给全局userinfo
 */
- (void)setUserInfoWithUserDefaults;

/**
 *  检查当前将要登录的用户和上一次登陆是否为同一用户
 *
 *  @param currentUser 当前登陆用户的token
 *
 *  @return 是与否
 */
- (BOOL)checkLastLoginUserIsCurrentUser:(NSString*)currentUser;
@end
