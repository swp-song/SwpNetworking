//
//  DemoModel.h
//  Demo
//
//  Created by swp_song on 16/5/16.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface DemoModel : NSObject

/*! 显示 title !*/
@property (nonatomic, copy  ) NSString *demoTitle;
/*! 跳转控制器 !*/
@property (nonatomic, assign) Class    demoJumpController;

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
+ (instancetype)demoInitWithTitle:(NSString *)demoTitle demoJumpController:(Class)demoJumpController;



@end
NS_ASSUME_NONNULL_END
