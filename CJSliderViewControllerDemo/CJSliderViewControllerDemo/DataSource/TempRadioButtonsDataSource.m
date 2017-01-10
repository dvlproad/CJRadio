//
//  TempRadioButtonsDataSource.m
//  CJSliderViewControllerDemo
//
//  Created by 李超前 on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "TempRadioButtonsDataSource.h"

@interface TempRadioButtonsDataSource () {
    
}
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, assign) NSInteger maxButtonShowCount;
@property (nonatomic, strong) RadioButton *radioButton;

@end

@implementation TempRadioButtonsDataSource

+ (RadioButtons *)getTempRadioButtons {
    RadioButtons *radioButtons = [[RadioButtons alloc] init];
    //radioButtons.hideSeparateLine = NO;
    radioButtons.showBottomLineView = YES;
    radioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    radioButtons.bottomLineColor = [UIColor redColor];
    radioButtons.bottomLineViewHeight = 6;
    [radioButtons addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                    rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                withArrowImageWidth:20];
    
    return radioButtons;
}

- (instancetype)initWithTitles:(NSArray *)titles
              defaultShowIndex:(NSInteger)defaultShowIndex
            maxButtonShowCount:(NSInteger)maxButtonShowCount
                   radioButton:(RadioButton *)radioButton
{
    self = [super init];
    if (self) {
        self.titles = titles;
        self.defaultSelectedIndex = defaultShowIndex;
        self.maxButtonShowCount = maxButtonShowCount;
        self.radioButton = radioButton;
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
    NSInteger showViewCount = MIN(self.titles.count, self.maxButtonShowCount);
    CGFloat sectionWidth = CGRectGetWidth(radioButtons.frame)/showViewCount;
    sectionWidth = ceilf(sectionWidth); //重点注意：当使用除法计算width时候，为了避免计算出来的值受除后，余数太多，除不尽(eg:102.66666666666667)，而造成的之后在通过左右箭头点击来寻找”要找的按钮“的时候，计算出现问题（”要找的按钮“需与“左右侧箭头的最左最右侧值”进行精确的比较），所以这里我们需要一个整数值，故我们这边选择向上取整。
    
    return sectionWidth;
}

- (RadioButton *)cj_radioButtons:(RadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index {
    NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"RadioButton_Slider" owner:nil options:nil];
    RadioButton *radioButton = [radioButtonNib lastObject];
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor greenColor];
    
    NSString *title = [self.titles objectAtIndex:index];
    [radioButton setTitle:title];
    
    return radioButton;
}


@end
