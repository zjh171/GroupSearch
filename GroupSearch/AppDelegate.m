//
//  AppDelegate.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "AppDelegate.h"
#import "QSSHomeViewController.h"
#import "QSSUserCenterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithRed:237/255.f green:237/255.f blue:237/255.f alpha:237/255.f];

    QSSHomeViewController *vc = [[QSSHomeViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
    UIImage *img0 = [UIImage imageNamed:@"ico_home"];
    navc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:img0 tag:0];

    QSSUserCenterViewController *vc2 = [[QSSUserCenterViewController alloc] init];
    UINavigationController *navc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UIImage *img = [UIImage imageNamed:@"ico_user"];
    navc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:img tag:1];
    
    UITabBarController *tabvc = [[UITabBarController alloc] init];
    tabvc.viewControllers = @[navc,navc2];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:0/255.0 green:119/255.0 blue:255/255.0 alpha:1.0];
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    UITabBar *bar2 = [UITabBar appearance];
    bar2.barTintColor = UIColor.whiteColor;

    self.window.rootViewController = tabvc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
