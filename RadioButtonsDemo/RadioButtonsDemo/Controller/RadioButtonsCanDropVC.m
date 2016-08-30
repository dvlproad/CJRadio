//
//  RadioButtonsCanDropVC.m
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/16.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "RadioButtonsCanDropVC.h"

#define kDefaultMaxShowCount    5

@interface RadioButtonsCanDropVC () <RadioButtonsDataSource, RadioButtonsDelegate> {
    NSArray *titles;
}

@end


@implementation RadioButtonsCanDropVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    titles =  @[@"人物", @"爱好", @"其他", @"地区"];
    self.dropdownRadioButtons.radioButtonType = RadioButtonTypeCanDrop;
    self.dropdownRadioButtons.dataSource = self;
    self.dropdownRadioButtons.delegate = self;
}

#pragma mark - RadioButtonsDataSource & RadioButtonsDelegate
- (NSInteger)cj_defaultShowIndexInRadioButtons:(RadioButtons *)radioButtons {
    return -1;
}

- (NSInteger)cj_numberOfComponentsInRadioButtons:(RadioButtons *)radioButtons {
    return titles.count;
}

- (CGFloat)cj_radioButtons:(RadioButtons *)radioButtons widthForComponentAtIndex:(NSInteger)index  {
    NSInteger showViewCount = MIN(titles.count, kDefaultMaxShowCount);
    CGFloat sectionWidth = CGRectGetWidth(radioButtons.frame)/showViewCount;
//    sectionWidth = ceilf(sectionWidth); //重点注意：当使用除法计算width时候，为了避免计算出来的值受除后，余数太多，除不尽(eg:102.66666666666667)，而造成的之后在通过左右箭头点击来寻找”要找的按钮“的时候，计算出现问题（”要找的按钮“需与“左右侧箭头的最左最右侧值”进行精确的比较），所以这里我们需要一个整数值，故我们这边选择向上取整。
    
    return sectionWidth;
}

- (RadioButton *)cj_radioButtons:(RadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index {
    NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"RadioButton_DropDown" owner:nil options:nil];
    RadioButton *radioButton = [radioButtonNib lastObject];
    [radioButton setTitle:titles[index]];
    radioButton.textNormalColor = [UIColor whiteColor];
    radioButton.textSelectedColor = [UIColor greenColor];
    
    radioButton.stateChangeCompleteBlock = ^(RadioButton *radioButton) {
        [UIView animateWithDuration:0.3 animations:^{
                    radioButton.imageView.transform = CGAffineTransformRotate(radioButton.imageView.transform, DEGREES_TO_RADIANS(180));
                }];
    };
    
    return radioButton;
}

- (void)cj_radioButtons:(RadioButtons *)radioButtonsCanDrop chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
    BOOL isSameIndex = index_cur == index_old ? YES : NO;

    if (isSameIndex) {
        [radioButtonsCanDrop cj_hideDropDownExtendView];
        [radioButtonsCanDrop setCurrentSelectedIndex:-1];
        
    } else {
        CGFloat width = CGRectGetWidth(radioButtonsCanDrop.frame);
        CGFloat height = 200;
        
        UIView *popupView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        popupView.clipsToBounds = YES;
        popupView.backgroundColor = [UIColor greenColor];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20, 50, 280, 44)];
        [btn setTitle:@"生成随机数，并设置" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [popupView addSubview:btn];
        
        
        __weak typeof(RadioButtons *)weakRadioButtonsCanDrop = radioButtonsCanDrop;
        CJTapViewTappedAction cjTapViewTappedAction = ^(UIView *view) {
            RadioButton *radioButton = (RadioButton *)[weakRadioButtonsCanDrop viewWithTag:RadioButton_TAG_BEGIN + radioButtonsCanDrop.currentSelectedIndex];
            radioButton.selected = !radioButton.selected;
        
            [weakRadioButtonsCanDrop cj_hideDropDownExtendView];
            [weakRadioButtonsCanDrop setCurrentSelectedIndex:-1];
        };
        radioButtonsCanDrop.cjTapViewTappedAction = cjTapViewTappedAction;

        [radioButtonsCanDrop cj_showDropDownExtendView:popupView withShowInView:self.view completeBlock:nil];
};
    
}

- (IBAction)btnAction:(id)sender{
    NSString *text = [NSString stringWithFormat:@"%d", rand()%10];
    [self.dropdownRadioButtons cj_radioButtonsDidSelectInExtendView:text];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
