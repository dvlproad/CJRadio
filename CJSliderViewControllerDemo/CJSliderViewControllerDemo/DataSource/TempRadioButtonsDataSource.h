//
//  TempRadioButtonsDataSource.h
//  CJSliderViewControllerDemo
//
//  Created by 李超前 on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RadioButtons/RadioButtons.h>

@interface TempRadioButtonsDataSource : NSObject <RadioButtonsDataSource> {
    
}
- (instancetype)initWithTitles:(NSArray *)titles
              defaultShowIndex:(NSInteger)defaultShowIndex
            maxButtonShowCount:(NSInteger)maxButtonShowCount
                   radioButton:(RadioButton *)radioButton;

+ (RadioButtons *)getTempRadioButtons;

@end
