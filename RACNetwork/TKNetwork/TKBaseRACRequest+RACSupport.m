//
//  TKBaseRACRequest+RACSupport.m
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#import "TKBaseRACRequest+RACSupport.h"
#import "TKMacro.h"
#import <YTKNetworkConfig.h>

NSString *const RACAFNResponseObjectErrorKey = @"responseObject";

@implementation TKBaseRACRequest (RACSupport)

#pragma mark - public

/// 上传图片
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
                  image:(UIImage *)image {
    return [[TKBaseRACRequest rac_requestPath:path method:@"POST" params:params withImages:@[image]]
            setNameWithFormat:@"%@ -rac_POST: %@, params: %@, image:", self.class, path, params];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
                 images:(NSArray *)images {
    return [[TKBaseRACRequest rac_requestPath:path method:@"POST" params:params withImages:images]
            setNameWithFormat:@"%@ -rac_POST: %@, params: %@, images:", self.class, path, params];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
              imageDict:(NSDictionary<NSString *, UIImage *> *)imageDict {
    return [[TKBaseRACRequest rac_requestPath:path method:@"POST" params:params imageDict:imageDict]
            setNameWithFormat:@"%@ -rac_POST: %@, params: %@, imageDict:", self.class, path, params];
}

/// 上传视频
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
                 videos:(NSArray *)videos {
    return [[TKBaseRACRequest rac_requestPath:path method:@"POST" params:params videos:videos]
            setNameWithFormat:@"%@ -rac_POST: %@, params: %@, videos:", self.class, path, params];
}

/// GET
+ (RACSignal *)rac_GET:(NSString *)path params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"GET"]
            setNameWithFormat:@"%@ -rac_GET: %@, params: %@", self.class, path, params];
}

/// POST
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"POST"]
            setNameWithFormat:@"%@ -rac_POST: %@, params: %@", self.class, path, params];
}

/// HEAD
+ (RACSignal *)rac_HEAD:(NSString *)path params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"HEAD"]
            setNameWithFormat:@"%@ -rac_HEAD: %@, params: %@", self.class, path, params];
}

/// 上传数据
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block {
    return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * request = [TKBaseRACRequest new];
        
        request.racPathURL = path;
        request.racMethod  = @"POST";
        request.racParameters = params;
        
        [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [request stop];
        }];
        
        
    }] setNameWithFormat:@"%@ -rac_POST: %@, parameters: %@, constructingBodyWithBlock:", self.class, path, params];
    ;
}

/// PUT
+ (RACSignal *)rac_PUT:(NSString *)path params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"PUT"]
            setNameWithFormat:@"%@ -rac_PUT: %@, params: %@", self.class, path, params];
}

/// PATCH
+ (RACSignal *)rac_PATCH:(NSString *)path params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"PATCH"]
            setNameWithFormat:@"%@ -rac_PATCH: %@, params: %@", self.class, path, params];
}

/// DELETE
+ (RACSignal *)rac_DELETE:(NSString *)path params:(id)params {
    return [[TKBaseRACRequest rac_requestPath:path params:params method:@"DELETE"]
            setNameWithFormat:@"%@ -rac_DELETE: %@, params: %@", self.class, path, params];
}

+ (RACSignal *)rac_requestPath:(NSString *)path
                        params:(id)params
                        method:(NSString *)method {

    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {

        TKBaseRACRequest * req = [TKBaseRACRequest new];

        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = params;

        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {

            [TKBaseRACRequest ALTKLogWithRequest:request];
            [TKBaseRACRequest requestResultSuccessWithRequest:request subscribe:subscriber];
            
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {

            [TKBaseRACRequest ALTKLogWithRequest:request];
            [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:YES];
        }];

        return [RACDisposable disposableWithBlock:^{
            //信号结束停止请求
            [req stop];
        }];
    }];
}

#pragma mark - private

/// 上传视频
+ (RACSignal *)rac_requestPath:(NSString *)path
                        method:(NSString *)method
                        params:(id)params
                    videos:(NSArray *)videos {
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = params;
        req.videos = videos;
        
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultSuccessWithRequest:request subscribe:subscriber];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:YES];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            //信号结束停止请求
            [req stop];
        }];
    }];
}

/// 上传单图
+ (RACSignal *)rac_requestPath:(NSString *)path
                        method:(NSString *)method
                        params:(id)params
                     withImage:(UIImage *)image {
    
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = params;
        req.image = image;
        
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultSuccessWithRequest:request subscribe:subscriber];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:YES];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            //信号结束停止请求
            [req stop];
        }];
    }];
}

/// 上传多图
+ (RACSignal *)rac_requestPath:(NSString *)path
                        method:(NSString *)method
                        params:(id)params
                    withImages:(NSArray *)images {
    
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = params;
        req.images = images;
        
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultSuccessWithRequest:request subscribe:subscriber];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:YES];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            //信号结束停止请求
            [req stop];
        }];
    }];
}


/// 上传多图
+ (RACSignal *)rac_requestPath:(NSString *)path
                        method:(NSString *)method
                        params:(id)params
                     imageDict:(NSDictionary<NSString *, UIImage *> *)imageDict {
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest *req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = params;
        req.imageDict = imageDict;
        
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultSuccessWithRequest:request subscribe:subscriber];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
            [self ALTKLogWithRequest:request];
            
            [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:YES];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            //信号结束停止请求
            [req stop];
        }];
    }];
}

+ (void)requestResultSuccessWithRequest:(YTKBaseRequest *)request subscribe:(id<RACSubscriber>)subscriber {
    
    NSDictionary *responseObject = [request.responseObject copy];
    
    if ([TKResponseSuccessCode isEqualToString:NSStringFormat(@"%@", responseObject[@"code"])]) {
        [subscriber sendNext:request.responseObject];
        [subscriber sendCompleted];
    } else {
        [TKBaseRACRequest requestResultFailureWithRequest:request subscribe:subscriber isNetError:NO];
    }
}

#warning 此处需要根据后端字段，指定msg和code
+ (void)requestResultFailureWithRequest:(YTKBaseRequest *)request
                              subscribe:(id<RACSubscriber>)subscriber
                             isNetError:(BOOL)isNetError {
    NSDictionary *responseObject = [request.responseObject copy];
    NSString *codeDesc = responseObject[@"msg"];
    NSString *code = responseObject[@"code"];
    
    NSError * error  = nil;
    
    if (responseObject) {
        error = [NSError errorWithDomain:codeDesc
                                    code:code.integerValue
                                userInfo:@{NSLocalizedDescriptionKey:codeDesc?:@"",@"msg":code}];
    } else {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:request.error.userInfo];
        
        error = [NSError errorWithDomain:request.error.domain
                                    code:request.error.code
                                userInfo:userInfo];
    }
    
    [subscriber sendError:error];
    [subscriber sendCompleted];
}

#pragma mark - log

+ (void)ALTKLogWithRequest:(YTKBaseRequest *)request {
    NSMutableDictionary *bodyParam = [[request requestArgument] mutableCopy];
    NSString *urlString = request.currentRequest.URL.absoluteString;
    id requestBody = bodyParam.allValues.count ? bodyParam : @"请求体为空";
    id responseObject = request.responseObject;
    TKLog(@"【接口】- %@\n【参数】\n%@\n【响应结果】\n%@", urlString, requestBody, responseObject);
//    NSLog(@"【接口】- %@\n【参数】\n%@\n【响应结果】\n%@", urlString, requestBody, responseObject);
}

- (void)dealloc {
    TKLog(@"%@ is dealloc",NSStringFromClass([self class]));
}
@end
