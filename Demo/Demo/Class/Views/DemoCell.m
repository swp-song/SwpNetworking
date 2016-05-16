//
//  DemoCell.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DemoCell.h"

#import "DemoModel.h"

@implementation DemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)demoCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier {

    DemoCell *cell      = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}


- (void)setDemo:(DemoModel *)demo {
    _demo = demo;
    [self setData:_demo];
}

- (void)setData:(DemoModel *)demo{
    self.textLabel.text = _demo.demoTitle;
}


@end
