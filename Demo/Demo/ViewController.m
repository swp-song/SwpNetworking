//
//  ViewController.m
//  Demo
//
//  Created by songweiping on 16/4/8.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpNetworking.h"
#import <SVProgressHUD/SVProgressHUD.h>

static NSString * const urlString   = @"http://o2oservice.youzhiapp.com/test/test_list2";
static NSString * const downloadUrl = @"https://raw.githubusercontent.com/swp-song/SwpNetworking/master/Screenshot/demImage02.jpeg";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel     *resultMessageView;
@property (nonatomic, weak) IBOutlet UIButton    *downloadFileButton;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self swpNetworkingGetData:urlString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swpNetworkingGetData:(NSString *)urlString {
    [SwpNetworking swpPOST:urlString parameters:nil swpNetworkingSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        NSLog(@"%@", resultObject);
        self.resultMessageView.text = @"请求成功";
    } swpNetworkingError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        NSLog(@"%@", errorMessage);
        self.resultMessageView.text = errorMessage;
    }];
}


- (IBAction)didButton:(UIButton *)button {
    
    [self downloadFile:downloadUrl];
}


- (void)downloadFile:(NSString *)fileURL {
    
    [SwpNetworking swpDownloadFile:fileURL swpDownloadProgress:^(SwpDownloadProgress swpDownloadProgress) {
        NSLog(@"swpFractionCompleted ==> %f, swpTotalUnitCount ==> %lld, swpCompletedUnitCount ==> %lld", swpDownloadProgress.swpFractionCompleted, swpDownloadProgress.swpTotalUnitCount, swpDownloadProgress.swpCompletedUnitCount);
        [SVProgressHUD showProgress:swpDownloadProgress.swpFractionCompleted status:@"下载中..."];
    } swpCompletionHandler:^(NSString * _Nonnull filePath, NSString * _Nonnull error) {
        error == nil ? [SVProgressHUD dismiss] : [SVProgressHUD showErrorWithStatus:error];
        NSLog(@"filePath ==> %@, erro ==> %@", filePath, error);
        UIImage *image       = [UIImage imageNamed:filePath];
        self.imageView.image = image;
    }];
}


@end
