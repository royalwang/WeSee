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
    [WSLoginWrapper wrapperLoginWithType:type completion:^(id obj,NSUInteger status,NSError *error){
        if (type == ThirdpartyLoginType_QQ) {
            if (self.superview) {
                [self removeFromSuperview];
            }
            TencentOAuth *tencentOAuth = (TencentOAuth*)obj;
            if (tencentOAuth) {
                NSLog(@"statusCode:%d,accessToken:%@",status,tencentOAuth.accessToken);
            }
        }
    }];
}
@end
