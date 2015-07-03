//
//  HHBaseNavigationController.h
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "OLog.h"
@interface HHBaseNavigationController : UINavigationController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic, strong) UIViewController *rootViewController;
@property(nonatomic, copy)NSString *viewControllerKey;//控制器的唯一标识
@property(nonatomic, weak) ICSDrawerController *drawer;

- (NSMutableDictionary *)config;

@end
