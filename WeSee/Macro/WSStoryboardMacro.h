//
//  WSStoryboardMacro.h
//  WeSee
//
//  Created by zzl on 14-3-31.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#ifndef WeSee_WSStoryboardMacro_h
#define WeSee_WSStoryboardMacro_h

/**
 *  根据storyboard名字返回UIStoryboard对象
 */
#define WSStoryboard(storyboardName) [UIStoryboard storyboardWithName:storyboardName bundle:nil]

#define kWS_Storyboard_Home @"WSHome"
#define kWS_Storyboard_Hot @"WSHot"
#define kWS_Storyboard_Left @"WSLeft"
#define kWS_Storyboard_Message @"WSMessage"
#define kWS_Storyboard_Me @"WSMe"
#define kWS_Storyboard_UploadVideo @"WSUploadVideo"

#endif
