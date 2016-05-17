//
//  SwpNetworkingVariableType.h
//  swp_song
//
//  Created by swp_song on 16/5/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwpNetworkingVariableType : NSObject

typedef long long swp_int64_t;

/*! SwpNetworking 的请求成功 回调 Block !*/
typedef void(^SwpNetworkingSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! SwpNetworking 的请求失败 回调 Block !*/
typedef void(^SwpNetworkingErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

/*! 表示 下载进度 结构体 !*/
struct SwpDownloadProgress {
    double      swpFractionCompleted;
    swp_int64_t swpTotalUnitCount;
    swp_int64_t swpCompletedUnitCount;
};
typedef struct SwpDownloadProgress SwpDownloadProgress;

/*!
 *  @author swp_song
 *
 *  @brief  SwpDownloadProgress ( 快速初始化 表示下载进度的结构体 )
 *
 *  @param  swpFractionCompleted
 *
 *  @param  swpTotalUnitCount
 *
 *  @param  swpCompletedUnitCount
 *
 *  @return SwpDownloadProgress
 */
SwpDownloadProgress SwpDownloadProgressMake(double swpFractionCompleted, swp_int64_t swpTotalUnitCount, swp_int64_t swpCompletedUnitCount);

/*! 网络状态  !*/
typedef NS_ENUM(NSInteger, SwpNetworkingReachabilityStatus) {
    SwpNetworkingReachabilityStatusUnknown          = -1,   /*! 未知网络    !*/
    SwpNetworkingReachabilityStatusNotReachable     = 0,    /*! 无网络      !*/
    SwpNetworkingReachabilityStatusReachableViaWWAN = 1,    /*! WWAN        !*/
    SwpNetworkingReachabilityStatusReachableViaWiFi = 2,    /*! WiFi        !*/
};

@end

NS_ASSUME_NONNULL_END
