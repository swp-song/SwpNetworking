//
//  DemoModel.m
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel

/*!
 *  @author swp_song
 *
 *  @brief  demoInitWithTitle:demoJumpController:   ( 工厂方法 )
 *
 *  @param  demoTitle
 (
 *  @param  demoJumpController
 *
 *  @return DemoModel
 */
+ (instancetype)demoInitWithTitle:(NSString *)demoTitle demoJumpController:(Class)demoJumpController {
    
    DemoModel *demoModel         = [[self alloc] init];
    demoModel.demoTitle          = demoTitle;
    demoModel.demoJumpController = demoJumpController;
    return demoModel;
}


@end
