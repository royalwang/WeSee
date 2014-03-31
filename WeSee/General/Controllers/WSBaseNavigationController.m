//
//  WSBaseNavigationController.m
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSBaseNavigationController.h"

@interface WSBaseNavigationController ()

@end

@implementation WSBaseNavigationController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setStyle
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if ([[UIDevice currentDevice].systemVersion floatValue] >=7.0f) {
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"public_title_bg_image_iphone_ios7"]  forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTitleTextAttributes:
             @{
               NSForegroundColorAttributeName:[UIColor colorWithRed:0.306 green:0.592 blue:0.910 alpha:1.000],
               NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f]
               }];
            
            CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
            UIGraphicsBeginImageContext(rect.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
            CGContextFillRect(context, rect);
            UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [self.navigationBar setShadowImage:theImage];
        }else{
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"public_title_bg_image_iphone"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTitleTextAttributes:
             @{
               NSForegroundColorAttributeName:[UIColor colorWithRed:0.306 green:0.592 blue:0.910 alpha:1.000],
               NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f],
               NSShadowAttributeName:[NSValue valueWithCGPoint:(CGPoint){0,0}],
               NSShadowAttributeName:[UIColor clearColor]
               }];
        }
    }else{
        if ([[UIDevice currentDevice].systemVersion floatValue] >=7.0f) {
            //        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"public_title_bg_image_iphone_ios7"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
            
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"public_title_bg_image_iphone_ios7"]  forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTitleTextAttributes:
             @{
               NSForegroundColorAttributeName:[UIColor colorWithRed:0.306 green:0.592 blue:0.910 alpha:1.000],
               NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0f]
               }];
            
            CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
            UIGraphicsBeginImageContext(rect.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
            CGContextFillRect(context, rect);
            UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [self.navigationBar setShadowImage:theImage];
        }else{
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"public_title_bg_image_iphone"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setTitleTextAttributes:
             @{
               NSForegroundColorAttributeName:[UIColor colorWithRed:0.306 green:0.592 blue:0.910 alpha:1.000],
               NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0f],
               NSShadowAttributeName:[NSValue valueWithCGPoint:(CGPoint){0,0}],
               NSShadowAttributeName:[UIColor clearColor]
               }];
        }
    }
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
