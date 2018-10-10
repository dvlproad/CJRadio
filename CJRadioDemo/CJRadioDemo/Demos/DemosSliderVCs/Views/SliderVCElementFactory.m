//
//  SliderVCElementFactory.m
//  CJRadioDemo
//
//  Created by 李超前 on 2018/10/10.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "SliderVCElementFactory.h"
#import <CJBaseUIKit/UIColor+CJHex.h>
#import "TestDataUtil.h"

@implementation SliderVCElementFactory

+ (CJRadioButtonCycleComposeView *)luckinRadioButtonCycleComposeView {
    CJRadioButtonCycleComposeView *radioButtonCycleComposeView = [[CJRadioButtonCycleComposeView alloc] init];
    radioButtonCycleComposeView.showBottomLineView = YES;
    radioButtonCycleComposeView.hideSeparateLine = YES;
    radioButtonCycleComposeView.bottomLineColor = CJColorFromHexString(@"#01adfe");
    //radioButtonCycleComposeView.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    radioButtonCycleComposeView.bottomLineViewHeight = 4;
    radioButtonCycleComposeView.bottomLineViewWidth = 52;
    
    radioButtonCycleComposeView.scrollType = CJCycleComposeViewScrollTypeBanScrollHorizontal;
    
    radioButtonCycleComposeView.defaultSelectedIndex = 0;
    radioButtonCycleComposeView.maxRadioButtonsShowViewCount = 3;
    radioButtonCycleComposeView.radioButtonsHeight = 50;
    
    return radioButtonCycleComposeView;
}

+ (CJRadioButtons *)luckinRadioButtons {
    CJRadioButtons *sliderRadioButtons = [[CJRadioButtons alloc] init];
    sliderRadioButtons.showBottomLineView = YES;
    sliderRadioButtons.hideSeparateLine = YES;
    sliderRadioButtons.bottomLineColor = CJColorFromHexString(@"#01adfe");
    //sliderRadioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    sliderRadioButtons.bottomLineViewHeight = 4;
    sliderRadioButtons.bottomLineViewWidth = 52;
    
    return sliderRadioButtons;
}

+ (CJButton *)luckinRadioButton {
    CJButton *radioButton = [[CJButton alloc] init];
    radioButton.backgroundColor = [UIColor whiteColor];
    radioButton.imagePosition = CJButtonImagePositionNone;
    radioButton.textNormalColor = CJColorFromHexString(@"#999999");
    radioButton.textSelectedColor = [UIColor blackColor];
    
    return radioButton;
}

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

+ (NSMutableArray<UIViewController *> *)demoComponentViewControllers {
    NSArray *radioModules = [TestDataUtil getRadioModules];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (CJRadioModule *radioModule in radioModules) {
        [viewControllers addObject:radioModule.viewController];
    }
    
    return viewControllers;
}

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

+ (CJButton *)demoRadioButton {
    CJButton *radioButton = [[CJButton alloc] init];
    radioButton.backgroundColor = [UIColor cyanColor];
    radioButton.imagePosition = CJButtonImagePositionLeft;
    radioButton.imageView.image = [UIImage imageNamed:@"checkedYES"];
    radioButton.textNormalColor = [UIColor whiteColor];
    radioButton.textSelectedColor = [UIColor blackColor];
    
    //radioButton.cjImageView.image = [UIImage imageNamed:@"checkedYES"];
    //[radioButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[radioButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    //radioButton.cjNormalBGColor = [UIColor greenColor];
    //radioButton.cjSelectedBGColor = [UIColor redColor];
    
    return radioButton;
}

+ (CJButton *)demoRadioButton2 {
    CJButton *radioButton = [[CJButton alloc] init];
    radioButton.layer.masksToBounds = YES;
    radioButton.layer.cornerRadius = 15;
    radioButton.clipsToBounds = YES;
    
    radioButton.backgroundColor = [UIColor colorWithRed:105/255.0 green:193/255.0 blue:243/255.0 alpha:1]; //#69C1F3
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor whiteColor];
    
    return radioButton;
}


+ (CJRadioButtons *)demoSliderRadioButtons {
    CJRadioButtons *sliderRadioButtons = [[CJRadioButtons alloc] init];
    
    return sliderRadioButtons;
}

@end
