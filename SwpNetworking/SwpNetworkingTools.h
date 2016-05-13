//
//  SwpNetworkingTools.h
//  swp_song
//
//  Created by swp_song on 16/5/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpNetworkingTools : NSObject

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsDownloadFilePathDispose:(NSURL *)filePath;

@end
NS_ASSUME_NONNULL_END
