//
//  AppDelegate+WindowRootViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "AppDelegate+WindowRootViewController.h"

#import "RadioButtonHomeViewController.h"
#import "SliderButtonsHomeViewController.h"
#import "PopopButtonsHomeViewController.h"

#import "CycleComposeViewHomeViewController.h"

#import "SliderVCsHomeViewController.h"

@implementation AppDelegate (WindowRootViewController)

- (UIViewController *)getMainRootViewController {
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_BG"];
    
    /*
    知识点(UITabBarController):
    ①设置标题tabBarItem.title：为了使得tabBarItem中的title可以和显示在顶部的navigationItem的title保持各自，分别设置.tabBarItem.title和.navigationItem的title的值
    ②设置图片tabBarItem.image：会默认去掉图片的颜色，如果要看到原图片，需要设置图片的渲染模式为UIImageRenderingModeAlwaysOriginal
    ③设置角标tabBarItem.badgeValue：如果没有设置图片，角标默认显示在左上角，设置了图片就会在图片的右上角显示
    */
    RadioButtonHomeViewController *homeViewController = [[RadioButtonHomeViewController alloc] init];
    homeViewController.view.backgroundColor = [UIColor whiteColor];
    homeViewController.navigationItem.title = NSLocalizedString(@"PopopButtons首页", nil);
    homeViewController.tabBarItem.title = NSLocalizedString(@"PopopButtons", nil);
    homeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //homeViewController. = @"10";
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    [tabBarController addChildViewController:homeNavigationController];
    
    
    SliderButtonsHomeViewController *scrollViewHomeViewController = [[SliderButtonsHomeViewController alloc] init];
    scrollViewHomeViewController.view.backgroundColor = [UIColor whiteColor];
    scrollViewHomeViewController.navigationItem.title = NSLocalizedString(@"SliderButtons首页", nil);
    scrollViewHomeViewController.tabBarItem.title = NSLocalizedString(@"SliderButtons", nil);
    scrollViewHomeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-calendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *scrollViewHomeNavigationController = [[UINavigationController alloc] initWithRootViewController:scrollViewHomeViewController];
    [tabBarController addChildViewController:scrollViewHomeNavigationController];
    
    PopopButtonsHomeViewController *foundationHomeViewController = [[PopopButtonsHomeViewController alloc] init];
    foundationHomeViewController.view.backgroundColor = [UIColor whiteColor];
    foundationHomeViewController.navigationItem.title = NSLocalizedString(@"PopopButtons首页", nil);
    foundationHomeViewController.tabBarItem.title = NSLocalizedString(@"PopopButtons", nil);
    foundationHomeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *foundationHomeNavigationController = [[UINavigationController alloc] initWithRootViewController:foundationHomeViewController];
    [tabBarController addChildViewController:foundationHomeNavigationController];
    
    CycleComposeViewHomeViewController *cycleComposeViewHomeViewController = [[CycleComposeViewHomeViewController alloc] init];
    cycleComposeViewHomeViewController.view.backgroundColor = [UIColor whiteColor];
    cycleComposeViewHomeViewController.navigationItem.title = NSLocalizedString(@"CycleComposeView首页", nil);
    cycleComposeViewHomeViewController.tabBarItem.title = NSLocalizedString(@"CycleComposeView", nil);
    cycleComposeViewHomeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *cycleComposeViewHomeNavigationController = [[UINavigationController alloc] initWithRootViewController:cycleComposeViewHomeViewController];
    [tabBarController addChildViewController:cycleComposeViewHomeNavigationController];
    
    SliderVCsHomeViewController *utilHomeViewController = [[SliderVCsHomeViewController alloc] init];
    utilHomeViewController.view.backgroundColor = [UIColor whiteColor];
    utilHomeViewController.navigationItem.title = NSLocalizedString(@"SliderVCs首页", nil);
    utilHomeViewController.tabBarItem.title = NSLocalizedString(@"SliderVCs", nil);
    utilHomeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *utilHomeNavigationController = [[UINavigationController alloc] initWithRootViewController:utilHomeViewController];
    [tabBarController addChildViewController:utilHomeNavigationController];
    
    return tabBarController;
}

@end
