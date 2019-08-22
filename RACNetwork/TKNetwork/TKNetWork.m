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
    return [TKBaseRACRequest rac_POST:url params:params image:image];
}

+ (RACSignal *)uploadImages:(NSArray *)images
                        url:(NSString *)url
                     params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params images:images];
}

+ (RACSignal *)uploadImageDict:(NSDictionary<NSString *, UIImage *> *)imageDict
                           url:(NSString *)url
                        params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params imageDict:imageDict];
}


+ (RACSignal *)uploadVideos:(NSArray *)videos
                        url:(NSString *)url
                     params:(NSDictionary *)params {
    return [TKBaseRACRequest rac_POST:url params:params videos:videos];
}


#pragma mark - TKNetWorkProtocol

+ (RACSignal *)getPath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_GET:path params:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)postPath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_POST:path params:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)putPath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_PUT:path params:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)headPath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_HEAD:path params:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)patchPath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_PATCH:path params:params]
              map:^id(RACTuple *value) {
                  return value;
              }] catch:^(NSError *error) {
                  return [RACSignal error:error];
              }] replayLazily];
}

+ (RACSignal *)deletePath:(NSString *)path params:(NSDictionary *)params {
    return [[[[TKBaseRACRequest rac_DELETE:path params:params]
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
