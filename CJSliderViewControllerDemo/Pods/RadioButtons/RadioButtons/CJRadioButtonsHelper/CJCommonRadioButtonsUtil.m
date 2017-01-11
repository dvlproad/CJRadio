//
//  CJCommonRadioButtonsUtil.m
//  RadioButtonsDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJCommonRadioButtonsUtil.h"

@implementation CJCommonRadioButtonsUtil

//RadioButtons
+ (void)commonSetupRadioButtons:(RadioButtons *)radioButtons
          commonRadioButtonType:(CJCommonRadioButtonType)commonRadioButtonType
{
    switch (commonRadioButtonType) {
        case CJCommonRadioButtonTypeSlider:
        {
            radioButtons.hideSeparateLine = YES;
            radioButtons.showBottomLineView = YES;
            radioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
            radioButtons.bottomLineColor = [UIColor clearColor];
            radioButtons.bottomLineViewHeight = 3;
            [radioButtons addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                            rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                        withArrowImageWidth:20];
            break;
        }
        case CJCommonRadioButtonTypeDropDown:
        {
            radioButtons.hideSeparateLine = NO;
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
