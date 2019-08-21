//
//  TKBaseRACRequest+RACSupport.h
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#import "TKBaseRACRequest.h"
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const RACAFNResponseObjectErrorKey;

@interface TKBaseRACRequest (RACSupport)

/// POST请求
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params;
/// 上传单张图片
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
              withImage:(UIImage *)image;
/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
             withImages:(NSArray *)images;
/// 上传多图
/// imageDict：key为图片上传的表单名，value是图片
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
          withImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict;
/// 上传视频
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
             withVideos:(NSArray *)videos;



/// A convenience around -GET:parameters:success:failure: that returns a cold signal of the
/// resulting JSON object and response headers or error.
+ (RACSignal *)rac_GET:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

/// A convenience around -HEAD:parameters:success:failure: that returns a cold signal of the
/// resulting JSON object and response headers or error.
+ (RACSignal *)rac_HEAD:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

/// A convenience around -POST:parameters:success:failure: that returns a cold signal of the
/// result.
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

/// A convenience around -POST:parameters:constructingBodyWithBlock:success:failure: that returns a
/// cold signal of the resulting JSON object and response headers or error.
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block;

/// A convenience around -PUT:parameters:success:failure: that returns a cold signal of the
/// resulting JSON object and response headers or error.
+ (RACSignal *)rac_PUT:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

/// A convenience around -PATCH:parameters:success:failure: that returns a cold signal of the
/// resulting JSON object and response headers or error.
+ (RACSignal *)rac_PATCH:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

/// A convenience around -DELETE:parameters:success:failure: that returns a cold signal of the
/// resulting JSON object and response headers or error.
+ (RACSignal *)rac_DELETE:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters;

@end

NS_ASSUME_NONNULL_END
