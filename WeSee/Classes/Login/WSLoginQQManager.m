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
            _completionBlock(_tencentOAuth,ThirdpartyLoginQQStatus_Success,nil);
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
    NSLog(@"...");
}
@end
