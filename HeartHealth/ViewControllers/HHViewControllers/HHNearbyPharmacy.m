//
//  HHNearby.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHNearbyPharmacy.h"

@interface HHNearbyPharmacy ()

@end

@implementation HHNearbyPharmacy

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"附近药店";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- parent
-(void)initParams
{
    self.viewControllerKey=@"HHNearbyPharmacy";
}
-(BOOL)rightHandleButtonHidden
{
    return  NO;
}

@end
