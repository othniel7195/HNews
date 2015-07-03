//
//  HHSmallGroup.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHSmallGroup.h"

@interface HHSmallGroup ()

@end

@implementation HHSmallGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"微圈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- parent
-(void)initParams
{
    self.viewControllerKey=@"HHSmallGroup";
}
-(BOOL)rightHandleButtonHidden
{
    return  YES;
}

@end
