//
//  SystemComposeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "SystemComposeViewController.h"
#import "SystemSliderVCElementFactory.h"

@interface SystemComposeViewController () <CJRadioButtonsDataSource, CJRadioButtonsDelegate> {
    
}

@end

@implementation SystemComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"RadioButtons + transitionFromViewController", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect navigationBarFrame = self.navigationController.navigationBar.bounds;
    CGFloat navigationBarHeight = CGRectGetHeight(navigationBarFrame);
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = CGRectGetHeight(statusBarFrame);  //20或44
    CGFloat topHeight = navigationBarHeight + statusBarHeight;
    
    //buttons
    CJRadioButtons *sliderRadioButtons = [[CJRadioButtons alloc] init];
    sliderRadioButtons.dataSource = self;
    sliderRadioButtons.delegate = self;
    [self.view addSubview:sliderRadioButtons];
    [sliderRadioButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(topHeight);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    self.sliderRadioButtons = sliderRadioButtons;
    
    // composeView
    UIView *composeView = [[UIView alloc] init];
    [self.view addSubview:composeView];
    [composeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sliderRadioButtons.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    self.cjComposeView = composeView;
    
    // titles
    self.titles = [SystemSliderVCElementFactory systemDemoComponentTitles];
    self.cjComponentViewControllers = [SystemSliderVCElementFactory systemDemoComponentViewControllers];
    self.defaultSelectedIndex = 0;
    self.maxButtonShowCount = 5;
}

#pragma mark - CJRadioButtonsDataSource
- (NSInteger)cj_defaultShowIndexInRadioButtons:(CJRadioButtons *)radioButtons {
    return self.defaultSelectedIndex;
}

- (NSInteger)cj_numberOfComponentsInRadioButtons:(CJRadioButtons *)radioButtons {
    return self.titles.count;
}

- (CGFloat)cj_radioButtons:(CJRadioButtons *)radioButtons widthForComponentAtIndex:(NSInteger)index  {
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

- (CJButton *)cj_radioButtons:(CJRadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index {
    CJButton *radioButton = [SystemSliderVCElementFactory systemDemoRadioButton];
    radioButton.title = [self.titles objectAtIndex:index];
    return radioButton;
}

#pragma mark - CJRadioButtonsDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    NSLog(@"---------------------");
    [self cjReplaceChildViewControllerIndex:index_old newChildViewControllerIndex:index_cur completeBlock:^(NSInteger index_cur) {
//        [self doSomethingToCon_whereIndex:index_cur];
    }];
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
