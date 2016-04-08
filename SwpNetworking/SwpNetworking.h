//
//  SwpNetworking.h
//  swp_song
//
//  Created by swp_song on 16/4/7.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import <AFNetworking/AFNetworking.h>     // AFNetworking 网络库
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN

/*! SwpNetworking 的请求成功 回调 Block !*/
typedef void(^SwpNetworkingSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! SwpNetworking 的请求失败 回调 Block !*/
typedef void(^SwpNetworkingErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

@interface SwpNetworking : NSObject


#pragma mark - SwpNetworking Tool Methods
/*!
 *  @author swp_song, 2016-04-07 14:08:45
 *
 *  @brief  swpPOST:parameters:swpResultSuccess:swpResultError:     ( 请求网络获取数据 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数     ( 和后台一致 )
 *
 *  @param  swpNetworkingSuccess            请求获取数据成功
 *
 *  @param  swpNetworkingError              请求获取数据失败
 */
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError;

/*!
 *  @author swp_song, 2016-04-07 14:45:47
 *
 *  @brief  swpPOSTAddFile:parameters:fileName:fileData:swpNetworkingSuccess:swpNetworkingError ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileName                        请求 上传文件的名称          ( 和后台一致 )
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  swpNetworkingSuccess            请求获取数据成功
 *
 *  @param  swpNetworkingError              请求获取数据失败
 *
 */
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError;

/*!
 *  @author swp_song, 2016-04-07 15:57:09
 *
 *  @brief  swpPOSTAddFiles:parameters:fileName:fileDatas:swpNetworkingSuccess:swpNetworkingError   ( 请求网络获上传文件 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileName                        请求 上传文件的名称          ( 和后台一致 )
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpNetworkingSuccess            请求获取数据成功
 *
 *  @param  swpNetworkingError              请求获取数据失败
 *
 */
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError;

/*!
 *  @author swp_song, 2016-04-07 16:26:22
 *
 *  @brief  swpPOSTAddWithFiles:parametersfileNames:fileDatas:swpNetworkingSuccess:swpNetworkingSuccess:swpNetworkingError: ( 请求网络获上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileNames                       请求 上传文件的名称数组      ( 和后台一致 )
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  swpNetworkingSuccess            请求获取数据成功
 *
 *  @param  swpNetworkingError              请求获取数据失败
 */
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError;

@end

NS_ASSUME_NONNULL_END
