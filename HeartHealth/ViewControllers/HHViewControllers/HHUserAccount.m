//
//  HHUserAccount.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHUserAccount.h"

@interface HHUserAccount ()

@end

@implementation HHUserAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的账户";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


#pragma mark ---parent
-(void)initParams
{
    self.viewControllerKey=@"HHUserAccount";
    
}
-(BOOL)rightHandleButtonHidden
{
    return  YES;
}

@end
