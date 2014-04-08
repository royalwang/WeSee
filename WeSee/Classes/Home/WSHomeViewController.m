//
//  WSMainViewController.m
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSHomeViewController.h"
#import "WSLoginView.h"

@interface WSHomeViewController ()

{
    WSLoginView *_loginView;
}

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //检查用户是否己经登陆
    if ([self checkUserIsLogin]) {
        [[WSGlobalManager sharedManager] setUserInfoWithUserDefaults];
    }else{
        UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
        if (!_loginView) {
            _loginView = [[[NSBundle mainBundle] loadNibNamed:@"WSLoginView" owner:self options:nil] objectAtIndex:0];
        }
        [window addSubview:_loginView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)checkUserIsLogin
{
    NSString *isLogin =  [ZLUserDefalutHelper userDefaultValueForKey:kUserIsLogin];
    if (isLogin && [isLogin boolValue]) {
        return YES;
    }
    return NO;
}

@end
