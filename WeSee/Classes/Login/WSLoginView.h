//
//  WSLoginView.h
//  WeSee
//
//  Created by zzl on 14-4-3.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSLoginView : UIView

@property (weak, nonatomic) IBOutlet UIButton *btnQQ;
@property (weak, nonatomic) IBOutlet UIButton *btnSina;

- (IBAction)loginButtonClicked:(UIButton *)sender;

@end
