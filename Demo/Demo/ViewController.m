//
//  ViewController.m
//  Demo
//
//  Created by songweiping on 16/4/8.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpNetworking.h"

static NSString * const urlString = @"http://o2oservice.youzhiapp.com/test/test_list2";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *resultMessageView;

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

@end
