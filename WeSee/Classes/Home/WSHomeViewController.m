//
//  WSMainViewController.m
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSHomeViewController.h"
#import <Parse/Parse.h>
#import "WSLoginWrapper.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface WSHomeViewController ()

@end

@implementation WSHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClicked:(UIButton *)sender
{
    [WSLoginWrapper wrapperLoginWithType:ThirdpartyLoginType_QQ completion:^(id obj,NSUInteger status,NSError *error){
        TencentOAuth *tencentOAuth = (TencentOAuth*)obj;
        if (tencentOAuth) {
            NSLog(@"statusCode:%d,accessToken:%@",status,tencentOAuth.accessToken);
        }
    }];
}

@end
