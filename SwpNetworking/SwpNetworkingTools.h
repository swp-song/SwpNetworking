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

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsGetDownloadFileName:(NSURL *)filePath;

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @param  networkActivityIndicatorVisible
 */
+ (void)swpNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsGetErrorMessage:(NSError *)error;

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsRequestDispose:      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpNetworkingToolsRequestDispose:(id)responseObject;

@end
NS_ASSUME_NONNULL_END
