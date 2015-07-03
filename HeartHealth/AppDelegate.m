//
//  AppDelegate.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "AppDelegate.h"
#import "HHLeftViewController.h"
#import "HHBaseNavigationController.h"
#import "HHHomePage.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    HHLeftViewController *leftViewController=[[HHLeftViewController alloc] initWithUserName:@"赵锋" userHeadUrl:nil];
    
    HHHomePage *homePage=[[HHHomePage alloc] init];
    
    HHBaseNavigationController *root=[[HHBaseNavigationController alloc] initWithRootViewController:homePage];
    
    ICSDrawerController *drawer = [[ICSDrawerController alloc]initWithLeftViewController:leftViewController centerViewController:root];
    
    
    self.window.rootViewController=drawer;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
