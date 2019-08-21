//
//  TKNetWork.m
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#import "TKNetWork.h"
#import "TKMacro.h"
#import "TKBaseRACRequest.h"
#import "TKBaseRACRequest+RACSupport.h"

@implementation TKNetWork

+ (RACSignal *)uploadImage:(UIImage *)image
                       url:(NSString *)url
                    params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params withImage:image];
}

+ (RACSignal *)uploadImages:(NSArray *)images
                        url:(NSString *)url
                     params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params withImages:images];
}

+ (RACSignal *)uploadImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict
                           url:(NSString *)url
                        params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params withImageDict:imageDict];
}


+ (RACSignal *)uploadVideos:(NSArray *)videos
                        url:(NSString *)url
                     params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params withVideos:videos];
}


#pragma mark - TKNetWorkProtocol

+ (RACSignal *)getPath:(NSString *)path params:(NSDictionary *)params {
    return [self getPath:path baseUrl:k_Base_Url params:params];
}

+ (RACSignal *)postPath:(NSString *)path params:(NSDictionary *)params {
    return [self postPath:path baseUrl:k_Base_Url params:params];
}

+ (RACSignal *)putPath:(NSString *)path params:(NSDictionary *)params {
    return [self putPath:path baseUrl:k_Base_Url params:params];
}

+ (RACSignal *)headPath:(NSString *)path params:(NSDictionary *)params {
    return [self headPath:path baseUrl:k_Base_Url params:params];
}

+ (RACSignal *)patchPath:(NSString *)path params:(NSDictionary *)params {
    return [self patchPath:path baseUrl:k_Base_Url params:params];
}

+ (RACSignal *)deletePath:(NSString *)path params:(NSDictionary *)params {
    return [self deletePath:path baseUrl:k_Base_Url params:params];
}


+ (RACSignal *)getPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_GET:path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)postPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_POST: path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)putPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_PUT: path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)headPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_HEAD:path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)patchPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_PATCH:path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)deletePath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_DELETE:path baseUrl:url parameters:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

- (void)dealloc {
    TKLog(@"%@ is dealloc！",NSStringFromClass([self class]));
}
@end
