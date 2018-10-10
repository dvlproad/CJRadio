//
//  SliderVCElementFactory.h
//  CJRadioDemo
//
//  Created by 李超前 on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJRadioButtonCycleComposeView.h"
#import "DemoSliderRadioButtonsDataSource.h"

@interface SliderVCElementFactory : NSObject

+ (CJRadioButtonCycleComposeView *)luckinRadioButtonCycleComposeView;

+ (CJRadioButtons *)luckinRadioButtons;
+ (CJButton *)luckinRadioButton;

+ (NSMutableArray<CJRadioModule *> *)demoRadioModules;
+ (NSArray<NSString *> *)demoComponentTitles;
+ (NSMutableArray<UIViewController *> *)demoComponentViewControllers;

+ (CJRadioButtonCycleComposeView *)demoRadioButtonCycleComposeView;

+ (CJButton *)demoRadioButton;
+ (CJButton *)demoRadioButton2;

+ (CJRadioButtons *)demoSliderRadioButtons;
@end
