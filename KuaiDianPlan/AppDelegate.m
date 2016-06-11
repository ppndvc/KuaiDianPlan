//
//  AppDelegate.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/10.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "AppDelegate.h"
#import "KDAppearance.h"
#import "ViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong)UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //设置主题颜色
    [KDAppearance setupAppearance];
    
    //设置window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
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
- (UITabBarController *)tabBarController
{
    if (!_tabBarController)
    {
        _tabBarController = [[UITabBarController alloc] init];
//        _tabBarController.delegate = self;
        _tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
        
        
        //创建券商选择页面视图
        UIViewController * vc1 =[[UIViewController alloc] init];
        vc1.title = @"首页";
        UINavigationController *mainPageNavi = [[UINavigationController alloc] initWithRootViewController:vc1];
        mainPageNavi.navigationBar.translucent = NO;
        mainPageNavi.tabBarItem.title = @"首页";
        //创建图片
        mainPageNavi.tabBarItem.image = [UIImage imageNamed:@"openAccountIcon"];
        mainPageNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"openAccountIconHighlight"];
        
        
        //创建券商选择页面视图
        UIViewController * vc2 =[[UIViewController alloc] init];
        UINavigationController *orderPageNavi = [[UINavigationController alloc] initWithRootViewController:vc2];
        orderPageNavi.navigationBar.translucent = NO;
        orderPageNavi.tabBarItem.title = @"订单";
        //创建图片
        orderPageNavi.tabBarItem.image = [UIImage imageNamed:@"openAccountIcon"];
        orderPageNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"openAccountIconHighlight"];
        
        //创建券商选择页面视图
        UIViewController * vc3 =[[UIViewController alloc] init];
        UINavigationController *secKillPageNavi = [[UINavigationController alloc] initWithRootViewController:vc3];
        secKillPageNavi.navigationBar.translucent = NO;
        secKillPageNavi.tabBarItem.title = @"抢饭";
        //创建图片
        secKillPageNavi.tabBarItem.image = [UIImage imageNamed:@"openAccountIcon"];
        secKillPageNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"openAccountIconHighlight"];
        
        //创建券商选择页面视图
        UIViewController * vc4 =[[UIViewController alloc] init];
        UINavigationController *myPageNavi = [[UINavigationController alloc] initWithRootViewController:vc4];
        myPageNavi.navigationBar.translucent = NO;
        myPageNavi.tabBarItem.title = @"我的";
        //创建图片
        myPageNavi.tabBarItem.image = [UIImage imageNamed:@"openAccountIcon"];
        myPageNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"openAccountIconHighlight"];

        
        _tabBarController.viewControllers = @[mainPageNavi,orderPageNavi,secKillPageNavi,myPageNavi];
        [_tabBarController setSelectedViewController:mainPageNavi];
    }
    
    return _tabBarController;
}
@end
