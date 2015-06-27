//
//  CostomTabBarViewController.m
//  Tabbar+Navigation
//
//  Created by xing on 15/6/27.
//  Copyright (c) 2015年 ljx. All rights reserved.
//

#import "CostomTabBarViewController.h"
#import "NavigationViewController.h"
#import "TestViewController.h"
#import "JXTabbar.h"
@interface CostomTabBarViewController ()<JXTabbarDelegate>

@end

@implementation CostomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ///添加controller  storyboard生成控制器的话 则删除以下控制器
    TestViewController *vc1 =[[TestViewController alloc]init];
    [self addController:vc1 title:@"最好笑1"];
    TestViewController *vc2 =[[TestViewController alloc]init];
    [self addController:vc2 title:@"最好笑2"];
    TestViewController *vc3 =[[TestViewController alloc]init];
    [self addController:vc3 title:@"最好笑3"];
    TestViewController *vc4 =[[TestViewController alloc]init];
    [self addController:vc4 title:@"最好笑4"];
    TestViewController *vc5 =[[TestViewController alloc]init];
    [self addController:vc5 title:@"最好笑5"];
    
    
    /**
     自定义视图view 来存放图片
     */
    JXTabbar *tabbar = [[JXTabbar alloc]init];
    tabbar.frame = self.tabBar.bounds;
    tabbar.delegate =self;
    for (int i = 0 ; i< self.childViewControllers.count; i++) {
        NSString *norImg = [NSString stringWithFormat:@"CostomTabBar%d",i+1];
        NSString *selImg = [NSString stringWithFormat:@"CostomTabBar%dSel",i+1];
        [tabbar setupWithImg:norImg selImg:selImg];
    }
    [self.tabBar addSubview:tabbar];
}
/**
 *  代码生成控制器则用这个跳转
 *  @param viewController 将要跳转的控制器
 *  @param title          标题
 */
- (void)addController:(UIViewController *)viewController title:(NSString *)title{
    viewController.navigationItem.title = title;
    NavigationViewController *nav = [[NavigationViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}
/**
 *  代理事件跳转控制器

 */
- (void)selectClick:(JXTabbar *)tabbar selectIndex:(NSInteger)index{
    self.selectedIndex = index;
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
