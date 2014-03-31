//
//  WSRootViewController.m
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSRootViewController.h"
#import "WSBaseNavigationController.h"

@interface WSRootViewController ()

@end

@implementation WSRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
        self.contentViewShadowColor = [UIColor blackColor];
        self.contentViewShadowOffset = CGSizeMake(0, 0);
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = YES;
        
        WSBaseNavigationController *nav = [WSStoryboard(@"WSHomeStoryboard") instantiateInitialViewController];
        self.contentViewController = nav;
        self.leftMenuViewController = [WSStoryboard(@"WSLeftStoryboard") instantiateViewControllerWithIdentifier:kWS_Storyboard_Left];
        //    self.backgroundImage = [UIImage imageNamed:@"Stars"];
//        self.view.backgroundColor = [UIColor redColor];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
