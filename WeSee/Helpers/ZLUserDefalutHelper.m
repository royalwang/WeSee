//
//  ZLUserDefalutHelper.m
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "ZLUserDefalutHelper.h"

@implementation ZLUserDefalutHelper

+ (id)userDefaultValueForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return obj;
}

+ (void)setUserDefaultValue:(id)value forKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
