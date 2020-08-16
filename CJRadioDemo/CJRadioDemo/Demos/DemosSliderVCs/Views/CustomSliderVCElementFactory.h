//
//  CustomSliderVCElementFactory.h
//  CJRadioDemo
//
//  Created by ciyouzen on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJRadioButtonCycleComposeView.h"

@interface CustomSliderVCElementFactory : NSObject

+ (NSMutableArray<CJRadioModule *> *)demoRadioModules;

// viewControllers
+ (NSMutableArray<UIViewController *> *)demoComponentViewControllers;

// composeView
+ (CJRadioButtonCycleComposeView *)demoRadioButtonCycleComposeView;

// button
+ (CJRadioButton *)demoRadioButton;

@end
