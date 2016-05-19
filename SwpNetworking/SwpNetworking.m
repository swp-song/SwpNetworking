//
//  SwpNetworking.m
//  swp_song
//
//  Created by swp_song on 16/4/7.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworking.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpNetworkingTools.h"          // 工具
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpNetworking ()

/*! AFHTTPSessionManager 网络请求管理者对象 !*/
@property (nonatomic, strong) AFHTTPSessionManager *swpSessionManager;

@end

@implementation SwpNetworking


#pragma mark - SwpNetworking Tool Methods
/*!
 *  @author swp_song
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
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [SwpNetworkingTools swpNetworkingToolsRequestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [SwpNetworkingTools swpNetworkingToolsGetErrorMessage:error]);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

/*!
 *  @author swp_song
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
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [SwpNetworkingTools swpNetworkingToolsRequestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [SwpNetworkingTools swpNetworkingToolsGetErrorMessage:error]);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

/*!
 *  @author swp_song
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
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [SwpNetworkingTools swpNetworkingToolsRequestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [SwpNetworkingTools swpNetworkingToolsGetErrorMessage:error]);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
}

/*!
 *  @author swp_song
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
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [SwpNetworkingTools swpNetworkingToolsRequestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [SwpNetworkingTools swpNetworkingToolsGetErrorMessage:error]);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
}

/*!
 *  @author swp_song
 *
 *  @brief  swpDownloadFile:swpDownloadProgress:swpCompletionHandler:   ( 请求网络 < 下载图片方法 > )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  swpDownloadProgress             下载进度
 *
 *  @param  swpCompletionHandler            下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))swpCompletionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest       *request       = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    AFHTTPSessionManager      *manager       = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    // 发起 请求
    [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    NSURLSessionDownloadTask *downloadTask   = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        swpDownloadProgress(SwpDownloadProgressMake(downloadProgress.fractionCompleted, downloadProgress.totalUnitCount, downloadProgress.completedUnitCount));
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 返回 文件 路径
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *downloadFilePath = [SwpNetworkingTools swpNetworkingToolsDownloadFilePathDispose:filePath];
        if (error) [[NSFileManager defaultManager] removeItemAtPath:downloadFilePath error:nil];
        swpCompletionHandler(downloadFilePath, [SwpNetworkingTools swpNetworkingToolsGetDownloadFileName:filePath], [SwpNetworkingTools swpNetworkingToolsGetErrorMessage:error]);
        [SwpNetworkingTools swpNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    // 开始 请求
    [downloadTask resume];
}


/*!
 *  @author swp_song
 *
 *  @brief  swpNetworkingReachabilityStatusChangeBlock: ( 验证 网路 环境 )
 *
 *  @param  swpNetworkingStatus
 */
+ (void)swpNetworkingReachabilityStatusChangeBlock:(void(^)(SwpNetworkingReachabilityStatus swpNetworkingStatus))swpNetworkingStatus {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                swpNetworkingStatus(SwpNetworkingReachabilityStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                swpNetworkingStatus(SwpNetworkingReachabilityStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                swpNetworkingStatus(SwpNetworkingReachabilityStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                swpNetworkingStatus(SwpNetworkingReachabilityStatusReachableViaWiFi);
                break;
            default:
                break;
        }
    }];
}


/*!
 *  @author swp_song
 *
 *  @brief swpAFNetworkingTest:parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @param  URLString                   请求的 url
 *
 *  @param  parameters                  请求 需要传递的参数
 */
+ (void)swpAFNetworkingTest:(NSString *)URLString parameters:(NSDictionary *)parameters {
    NSLog(@"This is AFNetworking Test Method");
}

#pragma mark - Init SwpNetworking Method
/*!
 *  @author swp_song, 2016-04-07 14:03:50
 *
 *  @brief  shareInstance       ( 单利 快速初始化一个 SwpNetworking )
 *
 *  @return SwpNetworking
 */
+ (instancetype)shareInstance {
    
    static SwpNetworking *swpNetworking = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        swpNetworking = [[self alloc] init];
    });
    return swpNetworking;
}
/*!
 *  @author swp_song, 2016-04-07 14:05:24
 *
 *  @brief  init    ( Init Override )
 *
 *  @return swpNetworking
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}


#pragma Init AFHTTPSessionManager Method
- (AFHTTPSessionManager *)swpSessionManager {
    
    if (!_swpSessionManager) {
        _swpSessionManager                    = [AFHTTPSessionManager manager];
        _swpSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_swpSessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/css", @"text/javascript", nil]];
    }
    return _swpSessionManager;
}




@end
