//
//  WSUserModel.h
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSUserModel : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *friendsNum;
@property (nonatomic, strong) NSString *attentionNum;
@property (nonatomic, strong) NSString *fansNum;

@end
