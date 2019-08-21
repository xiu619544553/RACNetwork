//
//  TKNetWorkProtocol.h
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TKNetWorkProtocol <NSObject>
@required
+ (RACSignal *)getPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;
+ (RACSignal *)postPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;
+ (RACSignal *)putPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;
+ (RACSignal *)headPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;
+ (RACSignal *)patchPath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;
+ (RACSignal *)deletePath:(NSString *)path baseUrl:(NSString *)url params:(NSDictionary *)params;

/// 可以不指定baseURL
+ (RACSignal *)getPath:(NSString *)path params:(NSDictionary *)params;
+ (RACSignal *)postPath:(NSString *)path params:(NSDictionary *)params;
+ (RACSignal *)putPath:(NSString *)path params:(NSDictionary *)params;
+ (RACSignal *)headPath:(NSString *)path params:(NSDictionary *)params;
+ (RACSignal *)patchPath:(NSString *)path params:(NSDictionary *)params;
+ (RACSignal *)deletePath:(NSString *)path params:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
