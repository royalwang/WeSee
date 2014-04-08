//
//  WSLoginView.m
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSLoginView.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <Parse/Parse.h>
#import "WSLoginWrapper.h"
#import "WSParseDataManager.h"

@implementation WSLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)loginButtonClicked:(UIButton *)sender {
    NSInteger tag = sender.tag;
    NSInteger type = ThirdpartyLoginType_QQ;
    if (tag == 101) {
        type = ThirdpartyLoginType_Sina;
    }
    [WSLoginWrapper wrapperLoginWithType:type completion:^(NSString *token,NSUInteger status,NSError *error){
        if (type == ThirdpartyLoginType_QQ) {
            if (self.superview) {
                [self removeFromSuperview];
            }
            if (token && !error) {
                //将用户信息的用户名和密码值都为token值，用来登陆Parse
                [WSGlobalManager sharedManager].userInfo.username = token;
                [WSGlobalManager sharedManager].userInfo.password = token;
                //登陆parse
                if (![[WSGlobalManager sharedManager] checkLastLoginUserIsCurrentUser:token]) {
                    [[WSParseDataManager sharedParseDataManager] loginWithModel:[WSGlobalManager sharedManager].userInfo Completion:^(BOOL succees,NSError *error){
                        NSLog(@"Parse登陆成功");
                    }];
                }
            }else{
                //处理qq授权错误信息
            }
        }
    }];
}
@end
