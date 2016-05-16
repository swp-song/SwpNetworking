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

@property (nonatomic, copy  ) NSString *demoTitle;
@property (nonatomic, assign) Class    demoJumpController;

+ (instancetype)demoInitWithTitle:(NSString *)demoTitle demoJumpController:(Class)demoJumpController;



@end
NS_ASSUME_NONNULL_END
