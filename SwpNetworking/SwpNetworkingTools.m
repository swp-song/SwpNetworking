//
//  SwpNetworkingTools.m
//  swp_song
//
//  Created by swp_song on 16/5/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworkingTools.h"

#import <UIKit/UIKit.h>

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

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @param  networkActivityIndicatorVisible
 */
+ (void)swpNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
+ (NSString *)swpNetworkingToolsGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingToolsRequestDispose:      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpNetworkingToolsRequestDispose:(id)responseObject {
    
    // 转换成 字符串
    NSString *decodeJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSLog(@"responseJson === > %@", decodeJson);
    
    if (!decodeJson) {
        NSAssert(@" responseObject ===> %@", decodeJson);
        return nil;
    }
    
    NSLog(@"responseObject ===> %@", decodeJson);
    
    // 字符串转成流
    NSData        *data      = [decodeJson dataUsingEncoding:NSUTF8StringEncoding];
    
    // 转换字典
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dictionary;
}


@end
