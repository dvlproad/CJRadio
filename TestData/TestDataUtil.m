//
//  TestDataUtil.m
//  CJRadioDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TestDataUtil.h"
#import "Home1.h"
#import "AChildViewController.h"
#import "BChildViewController.h"
#import "CChildViewController.h"
#import "DChildViewController.h"
#import "EChildViewController.h"
#import "FChildViewController.h"

@implementation TestDataUtil

+ (NSArray<NSString *> *)getComponentTitles {
    /*
    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    */
    NSArray *radioModules = [TestDataUtil getRadioModules];
    
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (CJRadioModule *radioModule in radioModules) {
        [titles addObject:radioModule.title];
    }
    
    return titles;
}

+ (NSArray<UIViewController *> *)getComponentViewControllers {
    NSArray *radioModules = [TestDataUtil getRadioModules];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (CJRadioModule *radioModule in radioModules) {
        [viewControllers addObject:radioModule.viewController];
    }
    
    return viewControllers;
}


+ (NSMutableArray<CJRadioModule *> *)getRadioModules {
    NSMutableArray *radioModules = [[NSMutableArray alloc] init];
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home1第一页";
        radioModule.viewController = [[AChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home2";
        radioModule.viewController = [[BChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home3是佛恩";
        radioModule.viewController = [[CChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home4天赐的爱";
        radioModule.viewController = [[DChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home5你是礼物";
        radioModule.viewController = [[EChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    {
        CJRadioModule *radioModule = [[CJRadioModule alloc] init];
        radioModule.title = @"Home6";
        radioModule.viewController = [[FChildViewController alloc] init];
        
        [radioModules addObject:radioModule];
    }
    
    
    return radioModules;
}

+ (void)addSubviewToViewController:(UIViewController *)viewController withText:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    label.backgroundColor = [UIColor cyanColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40];
    label.text = text;
    [viewController.view addSubview:label];
}


@end
