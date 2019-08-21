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
    [TKNetWork deletePath:@"xxx" params:nil];
}


@end
