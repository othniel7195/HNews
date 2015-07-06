//
//  HHNearbyHospital.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHNearbyHospital.h"
#import "Masonry.h"
@interface HHNearbyHospital ()

@property(nonatomic, strong)UILabel *label;
@end

@implementation HHNearbyHospital

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"附近医院";
    
    self.label=[[UILabel alloc] initWithFrame:CGRectZero];
    self.label.font=[UIFont systemFontOfSize:14.0];
    self.label.numberOfLines=0;
    [self.view addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(80);
        make.width.mas_equalTo(100);
        make.height.mas_greaterThanOrEqualTo(21);
    }];
    
    
    self.label.text=@"飒飒大萨达飒飒大萨达飒飒大萨达飒飒大萨达飒飒大萨达飒飒大萨达";
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
