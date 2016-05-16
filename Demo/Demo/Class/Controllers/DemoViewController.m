//
//  DemoViewController.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DemoViewController.h"

#import <Masonry/Masonry.h>

#import "DataRequestViewController.h"
#import "DataDownloadViewController.h"

#import "DemoCell.h"

#import "DemoModel.h"


static NSString * const kDemoCellID = @"kDemoCellID";

@interface DemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *demoTableView;
@property (nonatomic, copy  ) NSArray     *demoDataSource;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setting UI Methods
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
    self.navigationItem.title = @"";
}

/*!
 *  @author swp_song
 *
 *  @brief  setupUI ( 添加控件 | 设置控件自动布局 )
 */
- (void)setUpUI {
    [self.view addSubview:self.demoTableView];
}

/*!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout (设置控件的自动布局)
 */
- (void)setUIAutoLayout {
    
    [self.demoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DemoCell *cell = [DemoCell demoCellWithTableView:tableView forCellReuseIdentifier:kDemoCellID];
    cell.demo      = self.demoDataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoModel        *demo              = self.demoDataSource[indexPath.row];
    UIViewController *viewController    = [demo.demoJumpController new];
    viewController.navigationItem.title = demo.demoTitle;
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}



- (UITableView *)demoTableView {
    
    if (!_demoTableView) {
        _demoTableView            = [UITableView new];
        _demoTableView.dataSource = self;
        _demoTableView.delegate   = self;
        [_demoTableView registerClass:[DemoCell class] forCellReuseIdentifier:kDemoCellID];
        
    }
    return _demoTableView;
}

- (NSArray *)demoDataSource {
    
    if (!_demoDataSource) {
        DemoModel *dataRequest  = [DemoModel demoInitWithTitle:@"网络请求" demoJumpController:[DataRequestViewController class]];
        DemoModel *dataDownload = [DemoModel demoInitWithTitle:@"下载图片" demoJumpController:[DataDownloadViewController class]];
        _demoDataSource         = @[dataRequest, dataDownload];
        
    }
    return _demoDataSource;
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
