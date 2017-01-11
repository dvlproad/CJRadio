//
//  RadioButtonsCanDropVC.m
//  RadioButtonsDemo
//
//  Created by dvlproad on 15/11/16.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "RadioButtonsCanDropVC.h"
#import <CJPopupView/UIView+CJShowDropView.h>
#import "CJRadioButtonsHelper.h"
#import "TestDataUtil.h"

#define kDefaultMaxShowCount    5

@interface RadioButtonsCanDropVC () <RadioButtonsDelegate> {
    
}
@property (nonatomic, strong) CJCommonRadioButtonsDataSource *commonRadioButtonsDataSource;

@end


@implementation RadioButtonsCanDropVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.dropdownRadioButtons.radioButtonType = RadioButtonTypeCanDrop;
    self.dropdownRadioButtons.delegate = self;
    
    
    NSArray *titles = @[@"人物", @"爱好", @"其他", @"地区"];
    [self.dropdownRadioButtons commonSetupWithType:CJCommonRadioButtonTypeDropDown];
    
    self.commonRadioButtonsDataSource =
    [[CJCommonRadioButtonsDataSource alloc] initWithTitles:titles
                                          defaultShowIndex:-1
                                        maxButtonShowCount:kDefaultMaxShowCount
                                     commonRadioButtonType:CJCommonRadioButtonTypeDropDown];
    self.dropdownRadioButtons.dataSource = self.commonRadioButtonsDataSource;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.dropdownRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark -  RadioButtonsDelegate
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
        
        //TODO: 崩溃
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
    [self.dropdownRadioButtons changeCurrentRadioButtonStateAndTitle:text];
    
    [self.dropdownRadioButtons cj_hideDropDownExtendView];
    [self.dropdownRadioButtons setCurrentSelectedIndex:-1];
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
