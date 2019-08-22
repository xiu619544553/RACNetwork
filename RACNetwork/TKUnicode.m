//
//  TKUnicode.m
//  WJApp
//
//  Created by 韩秀辉 on 2017/10/12.
//  Copyright © 2017年 朴新教育科技集团. All rights reserved.
//

#import "TKUnicode.h"
#import <objc/runtime.h>

static inline void wj_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSString (ZXPUnicode)

- (NSString *)stringByReplaceUnicode {
    NSMutableString *convertedString = [self mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end

@implementation NSArray (ZXPUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        wj_swizzleSelector(class, @selector(description), @selector(wj_description));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(wj_descriptionWithLocale:));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(wj_descriptionWithLocale:indent:));
    });
}

/**
 *  我觉得
 *  可以把以下的方法放到一个NSObject的category中
 *  然后在需要的类中进行swizzle
 *  但是又觉得这样太粗暴了。。。。
 */

- (NSString *)wj_description {
    return [[self wj_description] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale {
    return [[self wj_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self wj_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSDictionary (ZXPUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        wj_swizzleSelector(class, @selector(description), @selector(wj_description));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(wj_descriptionWithLocale:));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(wj_descriptionWithLocale:indent:));
    });
}

- (NSString *)wj_description {
    return [[self wj_description] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale {
    return [[self wj_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self wj_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSSet (ZXPUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        wj_swizzleSelector(class, @selector(description), @selector(wj_description));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(wj_descriptionWithLocale:));
        wj_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(wj_descriptionWithLocale:indent:));
    });
}

- (NSString *)wj_description {
    return [[self wj_description] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale {
    return [[self wj_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)wj_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self wj_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}
@end
