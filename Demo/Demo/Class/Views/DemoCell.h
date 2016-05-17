//
//  DemoCell.h
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoModel;

NS_ASSUME_NONNULL_BEGIN
@interface DemoCell : UITableViewCell


/*! Demo 数据模型 !*/
@property (nonatomic, strong) DemoModel *demo;

/*!
 *  @author swp_song
 *
 *  @brief  demoCellWithTableView:forCellReuseIdentifier:   ( 快速 初始化 一个 cell )
 *
 *  @param  tableView
 *
 *  @param  identifier
 *
 *  @return DemoCell
 */
+ (instancetype)demoCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

@end
NS_ASSUME_NONNULL_END
