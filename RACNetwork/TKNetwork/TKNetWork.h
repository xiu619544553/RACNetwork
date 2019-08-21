//
//  TKNetWork.h
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RACSignal.h>
#import "TKNetWorkProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^EmptyValueBlock)(void);
typedef void(^NetWorkCodeBlock)(NSString * _Nullable code);
typedef void(^NetWorkCompletionBlock)(id _Nullable responseObject, NSError  * _Nullable error);

@interface TKNetWork : NSObject <TKNetWorkProtocol>

/**
 POST请求
 
 @param path uri
 @param params 参数
 */
+ (RACSignal *)postPath:(NSString *)path
                 params:(NSDictionary *)params;

/**
 上传带图片的数据

 @param image image
 @param url uri
 @param params 参数
 @return 信号
 */
+ (RACSignal *)uploadImage:(UIImage *)image
                       url:(NSString *)url
                    params:(NSDictionary *)params;


/**
 上传多图 - 随机生成图片上传的表单名
 
 @param images 图片数组
 @param url uri
 @param params 参数
 */
+ (RACSignal *)uploadImages:(NSArray *)images
                        url:(NSString *)url
                     params:(NSDictionary *)params;


/**
 上传多图
 
 @param imageDict 图片字典。key-表单名，value-UIImage对象
 @param url uri
 @param params 参数
 */
+ (RACSignal *)uploadImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict
                           url:(NSString *)url
                        params:(NSDictionary *)params;

/**
 上传视频
 
 @param videos 视频数组
 @param url uri
 @param params 参数
 */
+ (RACSignal *)uploadVideos:(NSArray *)videos
                        url:(NSString *)url
                     params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
