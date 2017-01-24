//
//  CJCommonRadioButtonsDataSource.h
//  CJSliderViewControllerDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RadioButtons.h"
#import "CJRadioButtonDefine.h"

@interface CJCommonRadioButtonsDataSource : NSObject <RadioButtonsDataSource> {
    
}
- (instancetype)initWithTitles:(NSArray *)titles
              defaultShowIndex:(NSInteger)defaultShowIndex
            maxButtonShowCount:(NSInteger)maxButtonShowCount
         commonRadioButtonType:(CJCommonRadioButtonType)commonRadioButtonType;


@end
