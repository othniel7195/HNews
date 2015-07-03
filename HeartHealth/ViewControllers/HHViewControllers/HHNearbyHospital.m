//
//  HHNearbyHospital.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHNearbyHospital.h"

@interface HHNearbyHospital ()

@end

@implementation HHNearbyHospital

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"附近医院";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- parent
-(void)initParams
{
    self.viewControllerKey=@"HHNearbyHospital";
}
-(BOOL)rightHandleButtonHidden
{
    return  YES;
}

@end
