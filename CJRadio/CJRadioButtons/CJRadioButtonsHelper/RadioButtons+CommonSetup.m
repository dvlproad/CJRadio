//
//  RadioButtons+CommonSetup.m
//  RadioButtonsDemo
//
//  Created by dvlproad on 2017/1/11.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "RadioButtons+CommonSetup.h"

@implementation RadioButtons (CommonSetup)

- (void)commonSetupWithType:(CJCommonRadioButtonType)commonRadioButtonType
{
    switch (commonRadioButtonType) {
        case CJCommonRadioButtonTypeSlider:
        {
            self.hideSeparateLine = YES;
            self.showBottomLineView = YES;
            self.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
            self.bottomLineColor = [UIColor clearColor];
            self.bottomLineViewHeight = 4;
            [self addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                    rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                withArrowImageWidth:20];
            break;
        }
        case CJCommonRadioButtonTypeDropDown:
        {
            self.hideSeparateLine = NO;
            break;
        }
        default:
        {
            break;
        }
    }
}


@end
