//
//  HHHomePage.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHHomePage.h"
#import "HHDetailWebView.h"
@interface HHHomePage ()

@end

@implementation HHHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    
    UIButton *test=[[UIButton alloc] initWithFrame:CGRectMake(20, 100, 60, 40)];
    test.backgroundColor=[UIColor yellowColor];
    [test addTarget:self action:@selector(testDone) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:test];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- parent
-(void)initParams
{
    self.viewControllerKey=@"HHHomePage";
}
-(BOOL)rightHandleButtonHidden
{
    return  NO;
}

#pragma mark --test 
-(void)testDone
{
    HHDetailWebView *dwv=[[HHDetailWebView alloc] init];
    
    [self.navigationController pushViewController:dwv animated:YES];
   
}
@end
