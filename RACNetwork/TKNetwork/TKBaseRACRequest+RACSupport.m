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
/// POST请求
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params {
    return [self rac_POST:path baseUrl:k_Base_Url parameters:params];
}

/// 上传图片
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
              withImage:(UIImage *)image {
    return [self rac_POST:path baseUrl:k_Base_Url parameters:params withImage:image];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
             withImages:(NSArray *)images {
    return [self rac_POST:path baseUrl:k_Base_Url parameters:params withImages:images];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
          withImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict {
    return [self rac_POST:path baseUrl:k_Base_Url parameters:params withImageDict:imageDict];
}

/// 上传视频
+ (RACSignal *)rac_POST:(NSString *)path
                 params:(id)params
             withVideos:(NSArray *)videos {
    return [self rac_POST:path baseUrl:k_Base_Url parameters:params withVideos:videos];
}

+ (RACSignal *)rac_GET:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"GET"]
            setNameWithFormat:@"%@ -rac_GET: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

+ (RACSignal *)rac_HEAD:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"HEAD"]
            setNameWithFormat:@"%@ -rac_HEAD: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"POST"]
            setNameWithFormat:@"%@ -rac_POST: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

+ (RACSignal *)rac_POST:(NSString *)path
                baseUrl:(NSString *)url
             parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block {
    return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        if (url) {
            YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
            config.baseUrl = url;
        }
        
        TKBaseRACRequest * request = [TKBaseRACRequest new];
        
        request.racPathURL = path;
        request.racMethod  = @"POST";
        request.racParameters = parameters;
        
        [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        }];
        
        
        return [RACDisposable disposableWithBlock:^{
            [request stop];
        }];
        
        
    }] setNameWithFormat:@"%@ -rac_POST: %@, parameters: %@, constructingBodyWithBlock:", self.class, path, parameters];
    ;
}

+ (RACSignal *)rac_PUT:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"PUT"]
            setNameWithFormat:@"%@ -rac_PUT: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
    
}

+ (RACSignal *)rac_PATCH:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"PATCH"]
            setNameWithFormat:@"%@ -rac_PATCH: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

+ (RACSignal *)rac_DELETE:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters {
    
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"DELETE"]
            setNameWithFormat:@"%@ -rac_DELETE: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

+ (RACSignal *)rac_requestPath:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters method:(NSString *)method {
    
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = parameters;
        
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

#pragma mark - private
/// 上传图片
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters withImage:(UIImage *)image {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"POST" withImage:image]
            setNameWithFormat:@"%@ -rac_POST: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters withImages:(NSArray *)images{
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"POST" withImages:images]
            setNameWithFormat:@"%@ -rac_POST: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

/// 上传多图
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters withImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"POST" withImageDict:imageDict] setNameWithFormat:@"%@ -rac_POST: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

/// 上传视频
+ (RACSignal *)rac_POST:(NSString *)path baseUrl:(NSString *)url parameters:(id)parameters withVideos:(NSArray *)videos {
    return [[self rac_requestPath:path baseUrl:url parameters:parameters method:@"POST" withVideos:videos]
            setNameWithFormat:@"%@ -rac_POST: %@,baseUrl: %@, parameters: %@", self.class, path,url, parameters];
}

/// 上传多多视频
+ (RACSignal *)rac_requestPath:(NSString *)path
                       baseUrl:(NSString *)url
                    parameters:(id)parameters
                        method:(NSString *)method
                    withVideos:(NSArray *)videos{
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = parameters;
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
                       baseUrl:(NSString *)url
                    parameters:(id)parameters
                        method:(NSString *)method
                     withImage:(UIImage *)image {
    
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = parameters;
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
                       baseUrl:(NSString *)url
                    parameters:(id)parameters
                        method:(NSString *)method
                    withImages:(NSArray *)images{
    
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest * req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = parameters;
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
                       baseUrl:(NSString *)url
                    parameters:(id)parameters
                        method:(NSString *)method
                 withImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict {
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        
        TKBaseRACRequest *req = [TKBaseRACRequest new];
        
        req.racPathURL = path;
        req.racMethod  = method;
        req.racParameters = parameters;
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
                             isNetError:(BOOL)isNetError
{
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
}

- (void)dealloc {
    TKLog(@"%@ is dealloc",NSStringFromClass([self class]));
}
@end
