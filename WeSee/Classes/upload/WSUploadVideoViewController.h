//
//  WSUploadVideoViewController.h
//  WeSee
//
//  Created by zzl on 14-4-4.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSBaseViewController.h"

@interface WSUploadVideoViewController : WSBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;
- (IBAction)uploadButtonClicked:(UIButton *)sender;

@end
