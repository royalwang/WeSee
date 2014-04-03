//
//  WSBaseViewController.h
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//
/**
 *  所有viewController的基类
 */
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface WSBaseViewController : UIViewController

/**
 *  导航条左边按钮点击事件，子类可重载
 */
- (void)backButtonClicked;

@end
