//
//  AFJSONResponseSerializer+TKAdd.m
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/21.
//  Copyright © 2019 TK. All rights reserved.
//

#import "AFJSONResponseSerializer+TKAdd.h"

@implementation AFJSONResponseSerializer (TKAdd)

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.acceptableContentTypes = [NSSet setWithObjects:
                                   @"application/json",
                                   @"text/json",
                                   @"text/javascript",
                                   @"text/html", nil];
    
    return self;
}

@end
