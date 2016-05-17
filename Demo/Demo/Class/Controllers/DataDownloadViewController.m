//
//  DataDownloadViewController.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DataDownloadViewController.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpNetworking.h"                   // 网络 获取数据
#import <Masonry/Masonry.h>                 // 自动布局
#import <SVProgressHUD/SVProgressHUD.h>     // 提示
/*! ---------------------- Tool       ---------------------- !*/


static NSString * const kDownloadUrl = @"https://raw.githubusercontent.com/swp-song/SwpNetworking/master/Screenshot/demImage.png";

@interface DataDownloadViewController ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 下载文件 按钮       !*/
@property (nonatomic, strong) UIButton    *downloadButton;
/*! 显示 下载 图片view  !*/
@property (nonatomic, strong) UIImageView *downloadImageView;
/*! ---------------------- UI   Property  ---------------------- !*/

@end

@implementation DataDownloadViewController

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
 *  @brief  设置 UI 控件
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
    [self.view addSubview:self.downloadButton];
    [self.view addSubview:self.downloadImageView];
}

/*!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout (设置控件的自动布局)
 */
- (void)setUIAutoLayout {
    
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(10, 0, 0, 0));
        make.height.equalTo(@30);
    }];
    
    [self.downloadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.downloadButton.mas_bottom).offset(10);
        make.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.equalTo(self.downloadImageView.mas_height).multipliedBy(4.0f / 3.0f);
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
    [self downloadFile:kDownloadUrl];
}

/*!
 *  @author swp_song
 *
 *  @brief  downloadFile:   ( 下载 文件  )
 *
 *  @param  fileURL
 */
- (void)downloadFile:(NSString *)fileURL {
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SwpNetworking swpDownloadFile:fileURL swpDownloadProgress:^(SwpDownloadProgress swpDownloadProgress) {
        NSLog(@"swpFractionCompleted ==> %f, swpTotalUnitCount ==> %lld, swpCompletedUnitCount ==> %lld", swpDownloadProgress.swpFractionCompleted, swpDownloadProgress.swpTotalUnitCount, swpDownloadProgress.swpCompletedUnitCount);
        [SVProgressHUD showProgress:swpDownloadProgress.swpFractionCompleted status:@"下载中..."];
    } swpCompletionHandler:^(NSString * _Nonnull filePath, NSString * _Nonnull error) {
        error == nil ? [SVProgressHUD dismiss] : [SVProgressHUD showErrorWithStatus:error];
        NSLog(@"filePath ==> %@, erro ==> %@", filePath, error);
        self.downloadImageView.image = [UIImage imageNamed:filePath];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    }];
}

#pragma mark - Init UI Methods
- (UIButton *)downloadButton {
    
    if (!_downloadButton) {
        _downloadButton                 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downloadButton setTitle:@"点击下载图片" forState:UIControlStateNormal];
        [_downloadButton setTitle:@"点击下载图片" forState:UIControlStateHighlighted];
        [_downloadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _downloadButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_downloadButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downloadButton;
}

- (UIImageView *)downloadImageView {
    
    if (!_downloadImageView) {
        _downloadImageView = [UIImageView new];
    }
    return _downloadImageView;
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
