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
+ (RACSignal *)getPath:(NSString *)path params:(nullable NSDictionary *)params;
+ (RACSignal *)postPath:(NSString *)path params:(nullable NSDictionary *)params;
+ (RACSignal *)putPath:(NSString *)path params:(nullable NSDictionary *)params;
+ (RACSignal *)headPath:(NSString *)path params:(nullable NSDictionary *)params;
+ (RACSignal *)patchPath:(NSString *)path params:(nullable NSDictionary *)params;
+ (RACSignal *)deletePath:(NSString *)path params:(nullable NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
