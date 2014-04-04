//
//  WSParseDataManager.m
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSParseDataManager.h"
#import <Parse/Parse.h>

@interface WSParseDataManager()

@property (nonatomic, strong) void (^completion)(BOOL succees,NSError *error);

@end
@implementation WSParseDataManager

+ (instancetype)sharedParseDataManager
{
    static WSParseDataManager *sharedParseDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedParseDataManager = [[WSParseDataManager alloc] init];
    });
    return sharedParseDataManager;
}

- (BOOL)isLogin
{
    if ([PFUser currentUser]) {
        return YES;
    }
    return NO;
}

- (void)loginWithModel:(WSUserModel*)model Completion:(void (^)(BOOL success,NSError *error))completion
{
    self.completion = completion;
    [self checkIsNewParseUserWithModel:model result:^(BOOL isNew,NSError *err){
        if (!err) {
            if (isNew) {
                PFUser *user = [PFUser user];
                user.username = model.username;
                user.password = model.password;
                user[kUserInfoKey_NickName] = model.nickname;
                user[kUserInfoKey_Sex] = model.sex;
                user[kUserInfoKey_FriendsNum] = model.friendsNum;
                user[kUserInfoKey_AttentionNum] = model.attentionNum;
                user[kUserInfoKey_FansNum] = model.fansNum;
                user[kUserInfoKey_Avatar] = model.avatar;
                [user signUpInBackgroundWithBlock:^(BOOL succ, NSError *error) {
                    if (succ) {
                        NSLog(@"注册成功");
                        _completion(succ,error);
                    }else{
                        _completion(succ,error);
                    }
                }];
            }else{
                [PFUser logInWithUsernameInBackground:model.username password:model.password block:^(PFUser *user, NSError *error) {
                    if (!error) {
                        NSLog(@"登录成功");
                        _completion(YES,error);
                    }else
                    {
                        _completion(NO,error);
                    }
                }];
            }
        }else{
            _completion(NO,err);
        }
    }];
}

- (void)checkIsNewParseUserWithModel:(WSUserModel*)model result:(void (^)(BOOL isNew,NSError *error))result
{
    PFQuery *query = [PFUser query];
    [query whereKey:kUserInfoKey_UserName equalTo:model.username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            result(objects.count ? NO:YES,nil);
        }else
        {
            result(NO,error);
        }
    }];
}

@end

