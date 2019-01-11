//
//  SystemSliderVCElementFactory.h
//  CJRadioDemo
//
//  Created by ciyouzen on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJRadioButtonCycleComposeView.h"

@interface SystemSliderVCElementFactory : NSObject

// titles
+ (NSArray<NSString *> *)systemDemoComponentTitles;

// viewControllers
+ (NSMutableArray<UIViewController *> *)systemDemoComponentViewControllers;

// button
+ (CJButton *)systemDemoRadioButton;

@end
