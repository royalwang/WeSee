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

- (void)setUserInfoWithDict:(NSDictionary*)dict;


@end
