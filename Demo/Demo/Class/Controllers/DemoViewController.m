//
//  DemoViewController.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DemoViewController.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <Masonry/Masonry.h>             // 自动布局
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
#import "DataRequestViewController.h"   // 获取 网络数据控制器
#import "DataDownloadViewController.h"  // 下载 文件控制器
#import "CheckNetworkViewController.h"  // 验证 网络环境控制器
/*! ---------------------- Controller ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "DemoCell.h"                    // 显示 demo cell
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "DemoModel.h"                   // Demo 数据模型
/*! ---------------------- Model      ---------------------- !*/


static NSString * const kDemoCellID = @"kDemoCellID";

@interface DemoViewController () <UITableViewDataSource, UITableViewDelegate>

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! view !*/
@property (nonatomic, strong) UITableView *demoTableView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 数据源 !*/
@property (nonatomic, copy  ) NSArray     *demoDataSource;
/*! ---------------------- Data Property  ---------------------- !*/

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
    self.navigationItem.title = @" SwpNetworking Demo ";
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


#pragma mark - UITableView DataSoure Methods
/*!
 *  @author swp_song
 *
 *  @brief  tableView DataSoure ( tableView 数据源方法 设置 tableView 分组个数 )
 *
 *  @param  tableView
 *
 *  @return NSInteger
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/*!
 *  @author swp_song
 *
 *  @brief  tableView DataSoure ( tableView 数据源方法 设置 tableView 分组中cell显示的个数 )
 *
 *  @param  tableView
 *
 *  @param  section
 *
 *  @return NSInteger
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoDataSource.count;
}

/*!
 *  @author swp_song
 *
 *  @brief  tableView DataSoure ( tableView 数据源方法 设置 tableView 分组中cell显示的数据 | 样式)
 *
 *  @param  tableView
 *
 *  @param  indexPath
 *
 *  @return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DemoCell *cell = [DemoCell demoCellWithTableView:tableView forCellReuseIdentifier:kDemoCellID];
    cell.demo      = self.demoDataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate Methods
/*!
 *  @author swp_song
 *
 *  @brief  tableView Delegate ( tableView 代理方法 点击每个cell调用 )
 *
 *  @param  tableView
 *
 *  @param  indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoModel        *demo              = self.demoDataSource[indexPath.row];
    UIViewController *viewController    = [demo.demoJumpController new];
    viewController.navigationItem.title = demo.demoTitle;
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - Init UI Methods
- (UITableView *)demoTableView {
    
    if (!_demoTableView) {
        _demoTableView            = [UITableView new];
        _demoTableView.dataSource = self;
        _demoTableView.delegate   = self;
        [_demoTableView registerClass:[DemoCell class] forCellReuseIdentifier:kDemoCellID];
        
    }
    return _demoTableView;
}

#pragma mark - Init Data Methods
- (NSArray *)demoDataSource {
    
    if (!_demoDataSource) {
        DemoModel *dataRequest  = [DemoModel demoInitWithTitle:@"网络请求" demoJumpController:[DataRequestViewController class]];
        DemoModel *dataDownload = [DemoModel demoInitWithTitle:@"下载图片" demoJumpController:[DataDownloadViewController class]];
        DemoModel *checkNetwork = [DemoModel demoInitWithTitle:@"检查网络" demoJumpController:[CheckNetworkViewController class]];
        _demoDataSource         = @[dataRequest, dataDownload, checkNetwork];
        
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
