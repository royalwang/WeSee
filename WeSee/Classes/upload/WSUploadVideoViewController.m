//
//  WSUploadVideoViewController.m
//  WeSee
//
//  Created by zzl on 14-4-4.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSUploadVideoViewController.h"
#import "QiniuResumableUploader.h"
#import <Parse/Parse.h>
#import "QiniuPutPolicy.h"

@interface WSUploadVideoViewController ()<QiniuUploadDelegate>

@property (nonatomic, strong)QiniuRioPutExtra *extra;
@property (nonatomic, strong)QiniuResumableUploader *rUploader;
@property (nonatomic, strong)NSString *filePath;
@property (nonatomic, strong)NSString *lastResumableKey;
@property (nonatomic, strong)NSString *token;

@end

@implementation WSUploadVideoViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)uploadButtonClicked:(UIButton *)sender
{
    self.filePath = [[NSBundle mainBundle] pathForResource:@"111" ofType:@"mp4"];
    NSString *token = [self tokenWithScope:kQiNiuBucket];
    self.rUploader = [[QiniuResumableUploader alloc] initWithToken:token];
    self.rUploader.delegate = self;
    self.extra = [QiniuRioPutExtra extraWithParams:[NSDictionary dictionaryWithObject:@"qiniu" forKey:@"x:cus"]];
    self.lastResumableKey = [NSString stringWithFormat:@"qiniu-%@", [self timeString]];
    [self.rUploader uploadFile:self.filePath key: self.lastResumableKey extra:self.extra];
}

- (NSString *) timeString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd-HH-mm-ss-zzz"];
    return [formatter stringFromDate:[NSDate date]];
}

// Upload progress
- (void)uploadProgressUpdated:(NSString *)theFilePath percent:(float)percent
{
    NSString *progressStr = [NSString stringWithFormat:@"Progress Updated: - %f\n", percent];
    
    NSLog(@"%@",progressStr);
}

- (void)uploadSucceeded:(NSString *)theFilePath ret:(NSDictionary *)ret
{
    NSString *succeedMsg = [NSString stringWithFormat:@"Upload Succeeded: - Ret: %@\n", ret];
    NSString *videoUrl = [NSString stringWithFormat:@"%@/%@",kQiNiuURL,self.lastResumableKey];
    NSLog(@"%@",succeedMsg);
    PFObject *video = [PFObject objectWithClassName:@"WSVideoList"];
    video[@"createAt"] = [NSDate date];
    video[@"videourl"] = videoUrl;
    video[@"type"] = @"1";
    video[@"decription"] = @"qiniu";
    video[@"lovenum"] = @"0";
    video[@"transpondnum"] = @"0";
    video[@"username"] = [WSGlobalManager sharedManager].userInfo.username;
    video[@"nickname"] = [WSGlobalManager sharedManager].userInfo.nickname;
    video[@"from"] = @"qiniu";
    [video saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
        if (succeeded) {
            NSLog(@"存储到parse成功");
        }
    }];
}

// Upload failed
- (void)uploadFailed:(NSString *)theFilePath error:(NSError *)error
{
    NSString *failMsg = [NSString stringWithFormat:@"Upload Failed: %@  - Reason: %@", theFilePath, error];
    
    NSLog(@"%@",failMsg);
}

- (NSString *)tokenWithScope:(NSString *)scope
{
    QiniuPutPolicy *policy = [[QiniuPutPolicy alloc] init];
    policy.scope = scope;
    
    return [policy makeToken:kQiNiuAccessKey secretKey:kQiNiuSearchKey];
}
@end
