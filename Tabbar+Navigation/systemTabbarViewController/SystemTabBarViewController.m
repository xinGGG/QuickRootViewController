//
//  TabBarViewController.m
//  Tabbar+Navigation
//
//  Created by xing on 15/6/27.
//  Copyright (c) 2015年 ljx. All rights reserved.
//

#import "SystemTabBarViewController.h"
#import "NavigationViewController.h"
#import "TestViewController.h"

//NavBar高度
#define NavigationBar_HEIGHT 44
//TabBar高度
#define TabBar_HEIGHT 49
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface SystemTabBarViewController ()
/**
 *  自定义tabbar背景颜色
 */
@property (nonatomic,weak)UIView *backView;
@end

@implementation SystemTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeTabbarBackgroundColor];
    // Do any additional setup after loading the view.
    TestViewController *MessageVC = [[TestViewController alloc]init];
    [self addChildViewController:MessageVC WithTitle:@"消息" image:@"tabbar1"];
    //添加按钮
    TestViewController *AddressListVC = [[TestViewController alloc]init];
    [self addChildViewController:AddressListVC WithTitle:@"通讯录"image:@"tabbar2"];
    //添加按钮
    TestViewController *AdhibitionVC = [[TestViewController alloc]init];
    [self addChildViewController:AdhibitionVC WithTitle:@"应用" image:@"tabbar3"];
    //添加按钮
    TestViewController *MoreVC = [[TestViewController alloc]init];
    [self addChildViewController:MoreVC WithTitle:@"更多" image:@"tabbar1"];
}

/**
 自定义tabbar 背景颜色
 */
- (void)changeTabbarBackgroundColor{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    backView.backgroundColor = [UIColor yellowColor];
    self.backView = backView ;
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
}

/**
 *  每次控制器视图改变都会执行这个方法
 */
- (void)viewDidLayoutSubviews{
    //调整tabbar自定义tabbar背景视图
    self.backView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 49);
}

/**
 *  系统tabbar布局的方法
 *
 *  @param vc       将要跳转的控制器
 *  @param title    tabbar+navigation的标题名称
 *  @param itemName 视图图片 (普通状态图片名称)  /  (选中状态图片名称)+Sel
 */
- (void)addChildViewController:(UIViewController *)vc WithTitle:(NSString *)title image:(NSString *)itemName{
    //设置tabbar 属性
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",itemName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@Sel",itemName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置tabbaritem 属性
    NSDictionary *norDict = [NSDictionary dictionary];
    norDict = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    [vc.tabBarItem setTitleTextAttributes:norDict forState:UIControlStateNormal];
    
    //设置tabbaritem - select 属性
    NSDictionary *selDict = [NSDictionary dictionary];
    selDict = @{NSForegroundColorAttributeName:[UIColor colorWithRed:44/255.0 green:244/255.0 blue:206/255.0 alpha:1]};
    [vc.tabBarItem setTitleTextAttributes:selDict forState:UIControlStateSelected];
    
    //包装到navigation 里面
    NavigationViewController *nav = [[NavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
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
