//
//  SwpNetworking.m
//  swp_song
//
//  Created by swp_song on 16/4/7.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpNetworking.h"


@interface SwpNetworking ()

/*! AFHTTPSessionManager 网络请求管理者对象 !*/
@property (nonatomic, strong) AFHTTPSessionManager *swpSessionManager;

@end

@implementation SwpNetworking


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
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpNetworking swpNetworkingSettingNetworkPicture:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpNetworking requestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [swpNetworking getErrorMessage:error]);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    }];
}

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
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpNetworking swpNetworkingSettingNetworkPicture:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpNetworking requestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [swpNetworking getErrorMessage:error]);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    }];
}

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
+ (void)swpPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpNetworking swpNetworkingSettingNetworkPicture:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpNetworking requestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [swpNetworking getErrorMessage:error]);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    }];
    
}

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
+ (void)swpPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError {
    
    // 初始化自定义网络请求类
    SwpNetworking        *swpNetworking = [SwpNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [swpNetworking swpNetworkingSettingNetworkPicture:YES];
    
    // 发起请求
    [swpNetworking.swpSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [swpNetworking requestDispose:responseObject];
        swpNetworkingSuccess(task, resultObject);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        swpNetworkingError(task, error, [swpNetworking getErrorMessage:error]);
        [swpNetworking swpNetworkingSettingNetworkPicture:NO];
    }];
    
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

#pragma mark - SwpNetworking Tool Methods

/*!
 *  @author swp_song, 2016-04-08 09:34:16
 *
 *  @brief  settingNetworkPicture:   ( 显示 或隐藏 网络获取数据时 UINavigationBar 上的图标(转圈的菊花) )
 *
 *  @param  isShow                  networkActivityIndicatorVisible YES 显示，NO 隐藏
 */
- (void)swpNetworkingSettingNetworkPicture:(BOOL)isShow {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = isShow;
}

/*!
 *  @author swp_song, 2016-04-07 16:01:10
 *
 *  @brief  getErrorMessage:    ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
- (NSString *)getErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}

#pragma mark - SwpNetworking Data Dispose Method
/*!
 *  @author swp_song, 2016-04-08 09:34:03
 *
 *  @brief  requestDispose:      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @return NSDictionary
 */
- (NSDictionary *)requestDispose:(id)responseObject {
    
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
