//
//  CheckNetworkViewController.m
//  Demo
//
//  Created by swp_song on 16/5/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "CheckNetworkViewController.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpNetworking.h"                   // 网络 获取
#import <SVProgressHUD/SVProgressHUD.h>     // 提示
/*! ---------------------- Tool       ---------------------- !*/

@interface CheckNetworkViewController ()

@end

@implementation CheckNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self checkNetwork];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [SVProgressHUD dismiss];
    NSLog(@"%s", __FUNCTION__);
}

/*!
 *  @author swp_song
 *
 *  @brief  验证 网络 环境
 */
- (void)checkNetwork {
    [SwpNetworking swpNetworkingReachabilityStatusChangeBlock:^(SwpNetworkingReachabilityStatus swpResultStatus) {
        
        switch (swpResultStatus) {
            case SwpNetworkingReachabilityStatusUnknown:
                [SVProgressHUD showInfoWithStatus:@"未知"];
                break;
            
            case SwpNetworkingReachabilityStatusNotReachable:
                [SVProgressHUD showInfoWithStatus:@"无网络"];
                break;
                
            case SwpNetworkingReachabilityStatusReachableViaWWAN:
                [SVProgressHUD showInfoWithStatus:@"WWAN"];
                break;
            case SwpNetworkingReachabilityStatusReachableViaWiFi:
                [SVProgressHUD showInfoWithStatus:@"WiFi"];
                break;
            default:
                break;
        }
        
//        [SVProgressHUD ]
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
