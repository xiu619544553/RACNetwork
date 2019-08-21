//
//  AFJSONResponseSerializer+TKAdd.h
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/21.
//  Copyright © 2019 TK. All rights reserved.
//

#import "AFURLResponseSerialization.h"

NS_ASSUME_NONNULL_BEGIN

/// 使用分类解决，YTKNetwork不能序列化text/html数据的问题
@interface AFJSONResponseSerializer (TKAdd)

@end

NS_ASSUME_NONNULL_END
