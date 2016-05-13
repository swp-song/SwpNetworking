//
//  AppDelegate+SVProgressHUD.m
//  Demo
//
//  Created by swp_song on 16/5/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "AppDelegate+SVProgressHUD.h"

#import <SVProgressHUD/SVProgressHUD.h>

@implementation AppDelegate (SVProgressHUD)

+ (void)demoSetSVProgressHUD {
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setFadeOutAnimationDuration:1];
}

@end
