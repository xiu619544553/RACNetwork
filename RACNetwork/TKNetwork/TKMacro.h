//
//  TKMacro.h
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/15.
//  Copyright © 2019 TK. All rights reserved.
//

#ifndef TKMacro_h
#define TKMacro_h

#define TKCurrentDate \
{ \
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; \
[dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; \
NSString *dateString = [dateFormatter stringFromDate:[NSDate date]]; \
return dateString; \
}

#ifndef TKLog
#ifdef DEBUG
#define TKLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define TKLog(FORMAT, ...) nil
#endif
#endif


#ifndef NSStringFormat
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#endif


// 接口
#define k_Base_Url @""
#define TKResponseSuccessCode @"200" // 请求成功的状态码


#endif /* TKMacro_h */
