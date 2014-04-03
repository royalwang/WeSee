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

- (void)loginWithUserDictionary:(NSDictionary*)userDict Completion:(void (^)(BOOL success,NSError *error))completion
{
    self.completion = completion;
}
@end
