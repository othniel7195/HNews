//
//  HHBaseViewController.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHBaseViewController.h"
#import "Okeys.h"
#import "HHUserAccount.h"
@interface HHBaseViewController ()

@end

@implementation HHBaseViewController

-(instancetype)init
{
    self=[super init];
    if (self) {
        
        [self initParams];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor=[UIColor blueColor];
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openUserAccount) name:user_account object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark ---控制器基本参数

-(void)initParams
{
    self.viewControllerKey=@"HHBaseViewController";
    
}
#pragma mark ---打开其他控制器
-(void)openUserAccount
{
    HHUserAccount *userA=[[HHUserAccount alloc] init];
    [self.navigationController pushViewController:userA animated:YES];
}
#pragma mark --- delloc
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:user_account object:nil];
}

@end
