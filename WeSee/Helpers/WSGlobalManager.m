//
//  WSGlobalManager.m
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSGlobalManager.h"

@implementation WSGlobalManager

+ (instancetype)sharedManager
{
    static WSGlobalManager *shareGlobalManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        shareGlobalManager = [[WSGlobalManager alloc] init];
    });
    return shareGlobalManager;
}

- (id)init
{
    if (self = [super init]) {
        _userInfo = [[WSUserModel alloc] init];
    }
    return self;
}

- (void)setUserInfoWithDict:(NSDictionary *)dict
{
    if (!dict) {
        return;
    }
    self.userInfo.nickname = dict[kUserInfoKey_NickName];
    self.userInfo.avatar = dict[kUserInfoKey_Avatar];
    self.userInfo.sex = dict[kUserInfoKey_Sex];
    self.userInfo.friendsNum = dict[kUserInfoKey_FriendsNum];
    self.userInfo.attentionNum = dict[kUserInfoKey_AttentionNum];
    self.userInfo.fansNum = dict[kUserInfoKey_FansNum];
    self.userInfo.isLogin = [ZLUserDefalutHelper userDefaultValueForKey:kUserIsLogin];
}
@end
