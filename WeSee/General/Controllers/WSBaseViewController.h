//
//  WSBaseViewController.h
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSBaseViewController : UIViewController

/**
 *  导航条左边按钮点击事件，子类可重载
 */
- (void)backButtonClicked;

@end
