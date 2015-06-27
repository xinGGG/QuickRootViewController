
介绍：
本项目中主要呈现TabbarViewController + NavigationController 自定义常用的代码片段。

目录结构:
- AppDelegate (入口)

    - CostomTabbarViewController 自定义图片tabbar+navigation
        -JXTabbar 自定义图片容器view
        -JXTabbarButton 取消自定义图片按钮的高亮

    - SystemTabbarViewController 系统样式tabbar+navigation




/*
 ============================================================
 
 CostomTabbarViewController      自定义视图view 来存放图片

 ============================================================
 */

/**
 *  代码生成控制器则用这个跳转
 *  @param viewController 将要跳转的控制器
 *  @param title          标题
 */
- (void)addController:(UIViewController *)viewController title:(NSString *)title;

/**
 *  代理事件跳转控制器
 */
- (void)selectClick:(JXTabbar *)tabbar selectIndex:(NSInteger)index;

/*
 ============================================================
 
 SystemTabbarViewController 采用系统自带的tabbar样式
 
 ============================================================
 */


/**
 自定义tabbar 背景颜色
 */
- (void)changeTabbarBackgroundColor;

/**
 *  每次控制器视图改变都会执行这个方法
 */
- (void)viewDidLayoutSubviews

/**
 *  系统tabbar布局的方法
 *
 *  @param vc       将要跳转的控制器
 *  @param title    tabbar+navigation的标题名称
 *  @param itemName 视图图片 (普通状态图片名称)  /  (选中状态图片名称)+Sel
 */
- (void)addChildViewController:(UIViewController *)vc WithTitle:(NSString *)title image:(NSString *)itemName;

/*
 ============================================================
 
 NavigationController
 
 ============================================================
 */

/**
 *  初始化导航 性能优化
 */
+(void)initialize ;
/**
 *  导航栏主题颜色+标题样式
 */
+ (void)setupNav;

/**
 *  导航栏左右按钮样式
 */
+ (void)setupItem;

/**
 *  每次push到下一个控制器都执行这个方法
 *
 *  @param viewController 准备跳转的控制器
 *  @param animated       是否动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated ;

