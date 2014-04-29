//
//  WSMessageViewController.m
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "WSMessageViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface WSMessageViewController ()
@property (nonatomic,strong) MPMoviePlayerController *player;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation WSMessageViewController

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
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"111" ofType:@"mp4"];
    NSString *path = @"http://weseee.qiniudn.com/qiniu-2014-04-08-15-03-47-GMT+8";
//    UIImage *image = [self getImageWihtUrl:path];
//    _imageView= [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 280)];
////    _imageView.image = image;
//    _imageView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:_imageView];
    [self generateImageWithUrl:path andThumbnailName:@"11"];
//    _player = [[MPMoviePlayerController alloc] initWithContentURL:url];
////    [[NSNotificationCenter defaultCenter] addObserver:self
////                                             selector:@selector(moviePlayBackDidFinish:)
////                                                 name:MPMoviePlayerPlaybackDidFinishNotification
////                                               object:_player];
//    _player.shouldAutoplay = YES;
//    _player.repeatMode = MPMovieRepeatModeOne;
////    _player.controlStyle = MPMovieControlStyleNone;
//    _player.movieSourceType = MPMovieSourceTypeFile;
//    [_player prepareToPlay];
//    [_player.view setFrame: CGRectMake(20, 100, 280, 280)];  // player's frame must match parent's
//    [self.view addSubview: _player.view];
//    // ...
//    [_player play];
}

-(UIImage *)getImageWihtUrl:(NSString *)videoURL

{

    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    //    NSURL *url = [[[NSURL alloc] initFileURLWithPath:videoURL] autorelease];
    NSURL *url=[[NSURL alloc]initWithString:videoURL];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(240, 150);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(60, 10) actualTime:NULL error:&error];
    UIImage *image = [UIImage imageWithCGImage: img];
    return image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moviePlayBackDidFinish:(NSNotification*)notification
{
    NSLog(@"播放完成");
}

-(void)generateImageWithUrl:(NSString *)theUrl andThumbnailName:(NSString *)theImgName
{
    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:[NSURL URLWithString:theUrl] options:nil];
    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform=TRUE;
    CMTime thumbTime = CMTimeMakeWithSeconds(0.1,60);
    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error)
    {
        if (result == AVAssetImageGeneratorFailed)
        {
            NSLog(@"couldn't generate thumbnail, error:%@", error);
        }
        if (result==AVAssetImageGeneratorSucceeded)
        {
            UIImage *theThumbnailsImage=[UIImage imageWithCGImage:im];
            _imageView.image = theThumbnailsImage;
//            [self saveToDocument:theThumbnailsImage withFilePath:[self pathForVideoThumbnails:theImgName]];
//            imageLoadTimes++;
//            if (imageLoadTimes%4==0)
//            {
//                [self reloadGridView];
//            }
            UIImageView *view= [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 280)];
            view.image = theThumbnailsImage;
//            _imageView.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:view];
        }
    };
    CGSize maxSize = CGSizeMake(320, 180);
    generator.maximumSize = maxSize;
    [generator generateCGImagesAsynchronouslyForTimes:[NSArray arrayWithObject:[NSValue valueWithCMTime:thumbTime]] completionHandler:handler];
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
