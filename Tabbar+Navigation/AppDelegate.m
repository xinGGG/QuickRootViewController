//
//  AppDelegate.m
//  Tabbar+Navigation
//
//  Created by xing on 15/6/27.
//  Copyright (c) 2015年 ljx. All rights reserved.
//

#import "AppDelegate.h"
#import "SystemTabBarViewController.h"
#import "CostomTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //需要在info文件设置控制器除控制器外的文件可以操作状态栏
    //隐藏状态栏
    application.statusBarHidden = NO;
    //状态栏颜色 - 光亮
    //application.statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //放置程序入口的控制器
//    SystemTabBarViewController *tabbar = [[SystemTabBarViewController alloc]init];
    
    CostomTabBarViewController *tabbar = [[CostomTabBarViewController alloc]init];
    [self.window setRootViewController:tabbar];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
