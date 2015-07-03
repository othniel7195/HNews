//
//  HHDetailWebView.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHDetailWebView.h"

@interface HHDetailWebView ()

@end

@implementation HHDetailWebView
- (instancetype)init
{
    self=[super init];
    if (self) {
        
        [self initParams];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.title=@"详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma  mark -- parent

-(void)initParams
{
    self.viewControllerKey=@"HHDetailWebView";
    
}
@end
