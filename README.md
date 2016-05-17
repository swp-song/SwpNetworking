# SwpNetworking



#### 封装 AFNetworking 3.0
`简单封装 AFNetworking 3.0, 让网络请求更简单`
[AFNetworking下载地址](https://github.com/AFNetworking/AFNetworking)

##### 效果：
![(网络获取数据)](https://raw.githubusercontent.com/swp-song/SwpNetworking/master/Screenshot/dataRequest.gif) ![(网络下载文件)](https://raw.githubusercontent.com/swp-song/SwpNetworking/master/Screenshot/downloadFile.gif) ![(验证网络环境)](https://raw.githubusercontent.com/swp-song/SwpNetworking/master/Screenshot/checkNetwork.gif)







##### 导入：



```
手动导入：

SwpNetworking 文件夹 导入 项目 中, 依赖  AFNetworking3.0 以上版本
#import "SwpNetworking.h"
```
---

```ruby

CocoaPods 导入:

使用  CocoaPods 会自动 pod AFNetworking

pod search SwpNetworking

pod 'SwpNetworking'

#import <SwpNetworking/SwpNetworking.h>

```
---



##### 更新:

```
1. 1.0.2 ---> 简单封装了 请求数据, 单文件 | 多文件 上传 
2. 1.0.3 ---> 新增下载文件, 验证网络环境
```

##### 使用:

---
```Objective-C

// 网络 获取 数据
+ (void)swpPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters swpNetworkingSuccess:(SwpNetworkingSuccessHandle)swpNetworkingSuccess swpNetworkingError:(SwpNetworkingErrorHandle)swpNetworkingError;

更多方法请参考 Demo

```

##### 新增方法 
```Objective-C
// 下载文件
+ (void)swpDownloadFile:(NSString *)URLString swpDownloadProgress:(void(^)(SwpDownloadProgress swpDownloadProgress))swpDownloadProgress swpCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))swpCompletionHandler;

// 验证网络环境
+ (void)swpNetworkingReachabilityStatusChangeBlock:(void(^)(SwpNetworkingReachabilityStatus swpResultStatus))swpResultStatus;
```
---
##### 备注:
```
交流 群号 : 85400118
```




