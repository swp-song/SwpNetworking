//
//  SwpNetworkingTools.m
//  swp_song
//
//  Created by swp_song on 16/5/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworkingTools.h"

@implementation SwpNetworkingTools

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsDownloadFilePathDispose:(NSURL *)filePath {
    return [NSString stringWithFormat:@"%@/%@", [SwpNetworkingTools swpNetworkingToolsGetDocumentsPath], [SwpNetworkingTools swpNetworkingToolsGetDownloadFileName:filePath]];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsGetDownloadFileName:(NSURL *)filePath {
    NSString *filePathString = [NSString stringWithFormat:@"%@", filePath];
    return [filePathString componentsSeparatedByString:@"/"].lastObject;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsGetDocumentsPath  ( 取出 documents 文件路径 )
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsGetDocumentsPath {
    NSArray  *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPaths = [paths objectAtIndex:0];
    return documentsPaths;
}


@end
