//
//  CJCommonRadioButtonsDataSource.m
//  CJSliderViewControllerDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJCommonRadioButtonsDataSource.h"

@interface CJCommonRadioButtonsDataSource () {
    
}
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, assign) NSInteger maxButtonShowCount;
@property (nonatomic, assign) CJCommonRadioButtonType commonRadioButtonType;

@end

@implementation CJCommonRadioButtonsDataSource

- (instancetype)initWithTitles:(NSArray *)titles
              defaultShowIndex:(NSInteger)defaultShowIndex
            maxButtonShowCount:(NSInteger)maxButtonShowCount
         commonRadioButtonType:(CJCommonRadioButtonType)commonRadioButtonType
{
    self = [super init];
    if (self) {
        self.titles = titles;
        self.defaultSelectedIndex = defaultShowIndex;
        self.maxButtonShowCount = maxButtonShowCount;
        self.commonRadioButtonType = commonRadioButtonType;
    }
    
    return self;
}

#pragma mark - RadioButtonsDataSource
- (NSInteger)cj_defaultShowIndexInRadioButtons:(RadioButtons *)radioButtons {
    return self.defaultSelectedIndex;
}

- (NSInteger)cj_numberOfComponentsInRadioButtons:(RadioButtons *)radioButtons {
    return self.titles.count;
}

- (CGFloat)cj_radioButtons:(RadioButtons *)radioButtons widthForComponentAtIndex:(NSInteger)index  {
    CGFloat totalWidth = CGRectGetWidth(radioButtons.frame);
    NSInteger showViewCount = MIN(self.titles.count, self.maxButtonShowCount);
    CGFloat sectionWidth = totalWidth/showViewCount;
    
    sectionWidth = ceilf(sectionWidth); //重点注意：当使用除法计算width时候，为了避免计算出来的值受除后，余数太多，除不尽(eg:102.66666666666667)，而造成的之后在通过左右箭头点击来寻找”要找的按钮“的时候，计算出现问题（”要找的按钮“需与“左右侧箭头的最左最右侧值”进行精确的比较），所以这里我们需要一个整数值，故我们这边选择向上取整。
    
    if (index == self.titles.count-1) {
        CGFloat hasUseWidth = (showViewCount-1) * sectionWidth;
        sectionWidth = totalWidth - hasUseWidth; //确保加起来的width不变
    }

    
    return sectionWidth;
}

- (RadioButton *)cj_radioButtons:(RadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index {
    /*
     NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"CJCommonRadioButton_Slider" owner:nil options:nil];
     RadioButton *radioButton = [radioButtonNib lastObject];
     */
    
    RadioButton *radioButton = [[RadioButton alloc] init];
    switch (self.commonRadioButtonType) {
        case CJCommonRadioButtonTypeSlider:
        {
            break;
        }
        case CJCommonRadioButtonTypeDropDown:
        {
            radioButton.imageView.image = [UIImage imageNamed:@"arrowDown_dark"];
            
            radioButton.stateChangeCompleteBlock = ^(RadioButton *radioButton) {
                [UIView animateWithDuration:0.3 animations:^{
                    radioButton.imageView.transform = CGAffineTransformRotate(radioButton.imageView.transform, DEGREES_TO_RADIANS(180));
                }];
            };
            break;
        }
        default:
        {
            break;
        }
    }
    radioButton.backgroundColor = [UIColor colorWithRed:105/255.0 green:193/255.0 blue:243/255.0 alpha:1]; //#69C1F3
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor whiteColor];

    
    radioButton.title = [self.titles objectAtIndex:index];
    
    return radioButton;
}

@end
