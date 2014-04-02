//
//  WSMainViewController.h
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSBaseViewController.h"

@interface WSHomeViewController : WSBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)loginButtonClicked:(UIButton *)sender;
@end
