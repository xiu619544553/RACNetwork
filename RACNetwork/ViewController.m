//
//  ViewController.m
//  RACNetwork
//
//  Created by hanxiuhui on 2019/8/14.
//  Copyright © 2019 TK. All rights reserved.
//

#import "ViewController.h"
#import "TKNetwork/TKNetWork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 100.f, 100.f);
    button.backgroundColor = UIColor.orangeColor;
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobile"] = @"15650723810";
    params[@"password"] = @"e10adc3949ba59abbe56e057f20f883e";
    [[TKNetWork postPath:@"/appapi/userenter/stu_login" params:params] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}


@end
