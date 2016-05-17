//
//  DataRequestViewController.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DataRequestViewController.h"


/*! ---------------------- Tool       ---------------------- !*/
#import "SwpNetworking.h"                   // 网络 获取数据
#import <Masonry/Masonry.h>                 // 自动布局
#import <SVProgressHUD/SVProgressHUD.h>     // 提示
/*! ---------------------- Tool       ---------------------- !*/

static NSString * const urlString = @"http://o2oservice.youzhiapp.com/test/test_list2";

@interface DataRequestViewController ()

@property (nonatomic, strong) UIButton *dataRequestButton;

@end

@implementation DataRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [SVProgressHUD dismiss];
    NSLog(@"%s", __FUNCTION__);
}


#pragma mark - Set UI Methods
/*!
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}

/*!
 *  @author swp_song
 *
 *  @brief  setNavigationBar    ( 设置导航栏 )
 */
- (void)setNavigationBar {
    
}

/*!
 *  @author swp_song
 *
 *  @brief  setupUI ( 添加控件 | 设置控件自动布局 )
 */
- (void)setUpUI {
    [self.view addSubview:self.dataRequestButton];
}

/*!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout (设置控件的自动布局)
 */
- (void)setUIAutoLayout {
    [self.dataRequestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(10, 0, 0, 0));
        make.height.equalTo(@30);
    }];
}

/*!
 *  @author swp_song
 *
 *  @brief  clickButton:  ( 按钮 点击 点击事件 )
 *
 *  @param  button
 */
- (void)clickButton:(UIButton *)button {
    [self swpNetworkingGetData:urlString];
}


/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingGetData:   ( 获取 网络数据 )
 *
 *  @param  urlString
 */
- (void)swpNetworkingGetData:(NSString *)urlString {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SwpNetworking swpPOST:urlString parameters:nil swpNetworkingSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        [SVProgressHUD showSuccessWithStatus:@"获取成功.."];
    } swpNetworkingError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [SVProgressHUD showErrorWithStatus:errorMessage];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    }];
}

#pragma mark - Init UI Methods
- (UIButton *)dataRequestButton {
    
    if (!_dataRequestButton) {
        _dataRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dataRequestButton setTitle:@"点击获取数据" forState:UIControlStateNormal];
        [_dataRequestButton setTitle:@"点击获取数据" forState:UIControlStateHighlighted];
        [_dataRequestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _dataRequestButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_dataRequestButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dataRequestButton;
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
