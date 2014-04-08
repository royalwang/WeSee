//
//  WSLoginManager.m
//  WeSee
//
//  Created by zzl on 14-4-2.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSLoginQQManager.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface WSLoginQQManager()<TencentSessionDelegate>

@property (nonatomic, strong) TencentOAuth *tencentOAuth;
@property (nonatomic, strong) LoginCompletionBlock completionBlock;

@end
@implementation WSLoginQQManager

+ (instancetype)sharedLoginQQManager
{
    static WSLoginQQManager *sharedLoginQQManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedLoginQQManager = [[WSLoginQQManager alloc] init];
	});
	return sharedLoginQQManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:kQQ_AppId andDelegate:self];
    }
    return self;
}

- (void)loginWithCompletion:(LoginCompletionBlock)completion
{
    self.completionBlock = completion;
    NSArray *permissions = [NSArray arrayWithObjects:@"all", nil];
    [_tencentOAuth authorize:permissions inSafari:NO];
}

#pragma mark TencentSessionDelegate Methods
- (void)tencentDidLogin
{
    NSLog(@"登录完成");
    
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length]){
        //  记录登录用户的OpenID、Token以及过期时间
        if (_completionBlock) {
            _completionBlock(_tencentOAuth.accessToken,ThirdpartyLoginQQStatus_Success,nil);
        }
        if (![_tencentOAuth getUserInfo]) {
            //token已过期
            if (_completionBlock) {
                _completionBlock(nil,ThirdpartyLoginQQStatus_InvalidToken,[[NSError alloc] init]);
            }
        }
    }else{
        if (_completionBlock) {
            _completionBlock(nil,ThirdpartyLoginQQStatus_NotAccessToken,[[NSError alloc] init]);
        }
    }
}
//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled){
        if (_completionBlock) {
            _completionBlock(nil,ThirdpartyLoginQQStatus_UserCancel,[[NSError alloc] init]);
        }
    }else{
        if (_completionBlock) {
            _completionBlock(nil,ThirdpartyLoginQQStatus_Fail,[[NSError alloc] init]);
        }
    }
}

//网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    if (_completionBlock) {
        _completionBlock(nil,ThirdpartyLoginQQStatus_NotNetwork,[[NSError alloc] init]);
    }
}

- (void)getUserInfoResponse:(APIResponse *)response
{
    if (URLREQUEST_SUCCEED == response.retCode && kOpenSDKErrorSuccess == response.detailRetCode && response.jsonResponse){
        //设置userdefault中的用户的各种信息，并将该值赋予WSGlobalManager的userInfo属性
        [ZLUserDefalutHelper setUserDefaultValue:@"1" forKey:kUserIsLogin];
        NSDictionary *responseDict = response.jsonResponse;
        NSDictionary *userInfo = [ZLUserDefalutHelper userDefaultValueForKey:_tencentOAuth.accessToken];
        NSMutableDictionary *tempUserInfo = nil;
        if (!userInfo) {
            tempUserInfo = [[NSMutableDictionary alloc] initWithCapacity:0];
            tempUserInfo[kUserInfoKey_FriendsNum] = @"0";
            tempUserInfo[kUserInfoKey_AttentionNum] = @"0";
            tempUserInfo[kUserInfoKey_FansNum] = @"0";
        }else{
            tempUserInfo = [[NSMutableDictionary alloc] initWithDictionary:userInfo];
        }
        tempUserInfo[kUserInfoKey_UserName] = _tencentOAuth.accessToken;
        tempUserInfo[kUserInfoKey_Password] = _tencentOAuth.accessToken;
        tempUserInfo[kUserInfoKey_NickName] = responseDict[@"nickname"];
        tempUserInfo[kUserInfoKey_Avatar] = responseDict[@"figureurl_qq_2"];
        tempUserInfo[kUserInfoKey_Sex] = responseDict[@"gender"];
        [ZLUserDefalutHelper setUserDefaultValue:tempUserInfo forKey:_tencentOAuth.accessToken];
        [[WSGlobalManager sharedManager] setUserInfoWithDict:tempUserInfo];
        [ZLUserDefalutHelper setUserDefaultValue:_tencentOAuth.accessToken forKey:kUserToken];
    }
}
@end
