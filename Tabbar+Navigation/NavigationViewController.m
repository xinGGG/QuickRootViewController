//
//  NavigationViewController.m
//  Tabbar+Navigation
//
//  Created by xing on 15/6/27.
//  Copyright (c) 2015年 ljx. All rights reserved.
//

#import "NavigationViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController
+(void)initialize {
    
    /**
     *  判断由JXNavigationViewController产生 优化性能
     */
    if ( self == [NavigationViewController class]) {
        
        [self setupNav];
        
        [self setupItem];
    }
}

/**
 *  导航栏主题颜色+标题样式
 */
+ (void)setupNav {
    
    //导航栏主题颜色
    UINavigationBar *bar = [UINavigationBar appearance];
    //bar 背景颜色
    bar.barTintColor = [UIColor whiteColor];
    //bar 默认图标颜色
    bar.tintColor = [UIColor orangeColor];
    bar.opaque = YES;
    bar.translucent = NO;
    
    //标题样式
    NSMutableDictionary *barStyle = [NSMutableDictionary dictionary];
    barStyle[NSForegroundColorAttributeName] = [UIColor whiteColor];
    barStyle[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [bar setTitleTextAttributes:barStyle];
    
}

/**
 *  导航栏左右按钮
 */
+ (void)setupItem{
    
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [item setTitleTextAttributes:dictM forState:UIControlStateNormal];
    
    //    导航条返回键带的title太讨厌了,怎么让它消失!
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)                                                      forBarMetrics:UIBarMetricsDefault];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count>0 ) {
        viewController.hidesBottomBarWhenPushed = YES;
        //通用back
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNmlImg:@"icon_back" hltImg:@"icon_back" target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    
    [self popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
