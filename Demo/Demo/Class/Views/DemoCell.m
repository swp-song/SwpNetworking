//
//  DemoCell.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DemoCell.h"

/*! ---------------------- Model      ---------------------- !*/
#import "DemoModel.h"                   // demo 数据模型
/*! ---------------------- Model      ---------------------- !*/

@implementation DemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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
+ (instancetype)demoCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier {

    DemoCell *cell      = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/*!
 *  @author swp_song
 *
 *  @brief  setDemo:    ( 重写 数据 set 方法 )
 *
 *  @param demo
 */
- (void)setDemo:(DemoModel *)demo {
    _demo = demo;
    [self setData:_demo];
}

/*!
 *  @author swp_song
 *
 *  @brief  setData:    ( 设置 数据 )
 *
 *  @param  demo
 */
- (void)setData:(DemoModel *)demo{
    self.textLabel.text = _demo.demoTitle;
}


@end
