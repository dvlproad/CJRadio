//
//  CustomSliderVCElementFactory.m
//  CJRadioDemo
//
//  Created by ciyouzen on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "CustomSliderVCElementFactory.h"
#import <CJBaseUIKit/UIColor+CJHex.h>
#import "TestDataUtil.h"

@implementation CustomSliderVCElementFactory

+ (NSMutableArray<CJRadioModule *> *)demoRadioModules {
    return [TestDataUtil getRadioModules];
}

+ (NSArray<NSString *> *)demoComponentTitles {
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

// viewControllers
+ (NSMutableArray<UIViewController *> *)demoComponentViewControllers {
    NSArray *radioModules = [TestDataUtil getRadioModules];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (CJRadioModule *radioModule in radioModules) {
        [viewControllers addObject:radioModule.viewController];
    }
    
    return viewControllers;
}

// composeView
+ (CJRadioButtonCycleComposeView *)demoRadioButtonCycleComposeView {
    CJRadioButtonCycleComposeView *radioButtonCycleComposeView = [[CJRadioButtonCycleComposeView alloc] init];
    radioButtonCycleComposeView.showBottomLineView = YES;
//    self.sliderRadioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
//    self.sliderRadioButtons.bottomLineColor = [UIColor redColor];
    radioButtonCycleComposeView.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    radioButtonCycleComposeView.bottomLineViewHeight = 4;
    radioButtonCycleComposeView.bottomLineViewWidth = 52;
    [radioButtonCycleComposeView addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                        rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                                    withArrowImageWidth:20];
    
    radioButtonCycleComposeView.scrollType = CJCycleComposeViewScrollTypeBanScrollHorizontal;
    
    radioButtonCycleComposeView.defaultSelectedIndex = 1;
    radioButtonCycleComposeView.maxRadioButtonsShowViewCount = 4;
    radioButtonCycleComposeView.radioButtonsHeight = 50;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [radioButtonCycleComposeView addRadioButtonsLeftView:leftButton withWidth:60];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [radioButtonCycleComposeView addRadioButtonsRightView:rightButton withWidth:40];
    
    return radioButtonCycleComposeView;
}

// button
+ (CJRadioButton *)demoRadioButton {
    CJRadioButton *radioButton = [[CJRadioButton alloc] init];
    radioButton.backgroundColor = [UIColor cyanColor];
    radioButton.imagePosition = CJButtonImagePositionLeft;
    radioButton.imageView.image = [UIImage imageNamed:@"checkedYES"];
    radioButton.textNormalColor = [UIColor whiteColor];
    radioButton.textSelectedColor = [UIColor blackColor];
    
    return radioButton;
}

@end
