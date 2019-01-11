//
//  SystemSliderVCElementFactory.m
//  CJRadioDemo
//
//  Created by ciyouzen on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "SystemSliderVCElementFactory.h"
#import <CJBaseUIKit/UIColor+CJHex.h>

#import "AChildViewController.h"
#import "BChildViewController.h"
#import "CChildViewController.h"
#import "DChildViewController.h"
#import "EChildViewController.h"
#import "FChildViewController.h"

@implementation SystemSliderVCElementFactory

// titles
+ (NSArray<NSString *> *)systemDemoComponentTitles {
    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    return titles;
}

// viewControllers
+ (NSMutableArray<UIViewController *> *)systemDemoComponentViewControllers {
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    {
        AChildViewController *viewController = [[AChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    {
        BChildViewController *viewController = [[BChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    {
        CChildViewController *viewController = [[CChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    {
        DChildViewController *viewController = [[DChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    {
        EChildViewController *viewController = [[EChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    {
        FChildViewController *viewController = [[FChildViewController alloc] init];
        [viewControllers addObject:viewController];
    }
    
    return viewControllers;
}

// button
+ (CJButton *)systemDemoRadioButton {
    CJButton *radioButton = [[CJButton alloc] init];
    radioButton.layer.masksToBounds = YES;
    radioButton.layer.cornerRadius = 15;
    radioButton.clipsToBounds = YES;
    
    radioButton.backgroundColor = [UIColor colorWithRed:105/255.0 green:193/255.0 blue:243/255.0 alpha:1]; //#69C1F3
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor whiteColor];
    
    return radioButton;
}

@end
