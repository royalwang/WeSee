//
//  ZLUserDefalutHelper.h
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLUserDefalutHelper : NSObject

+ (id)userDefaultValueForKey:(NSString*)key;

+ (void)setUserDefaultValue:(id)value forKey:(NSString*)key;

@end
