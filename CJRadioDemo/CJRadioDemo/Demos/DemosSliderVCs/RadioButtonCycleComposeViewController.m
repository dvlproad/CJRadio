//
//  RadioButtonCycleComposeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "RadioButtonCycleComposeViewController.h"
#import "TestDataUtil.h"

@interface RadioButtonCycleComposeViewController () <CJButtonControllerViewDataSource, CJButtonControllerViewDelegate>

@end

@implementation RadioButtonCycleComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"SliderViewController首页", nil);
    
    NSArray *radioModules = [TestDataUtil getRadioModules];
    
    
    self.radioButtonCycleComposeView.radioModules =  radioModules;
    self.radioButtonCycleComposeView.showBottomLineView = YES;
//    self.sliderRadioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
//    self.sliderRadioButtons.bottomLineColor = [UIColor redColor];
    self.radioButtonCycleComposeView.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    self.radioButtonCycleComposeView.bottomLineViewHeight = 6;
    [self.radioButtonCycleComposeView addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                 rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                             withArrowImageWidth:20];
    
    self.radioButtonCycleComposeView.componentViewParentViewController = self;
    
    self.radioButtonCycleComposeView.defaultSelectedIndex = 1;
    self.radioButtonCycleComposeView.maxRadioButtonsShowViewCount = 4;
    self.radioButtonCycleComposeView.radioButtonsHeight = 50;
    
    self.radioButtonCycleComposeView.dataSource = self;
    self.radioButtonCycleComposeView.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.radioButtonCycleComposeView addRadioButtonsLeftView:button withWidth:60];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.radioButtonCycleComposeView addRadioButtonsRightView:rightButton withWidth:40];
    
    [self.radioButtonCycleComposeView reloadData];
}

//一定不要漏了这个滚动操作
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.radioButtonCycleComposeView scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark - CJButtonControllerViewDataSource && CJButtonControllerViewDelegate
- (CJButton *)cj_buttonControllerView:(CJRadioButtonCycleComposeView *)buttonControllerView cellForComponentAtIndex:(NSInteger)index {
    CJButton *radioButton = [[CJButton alloc] init];
    radioButton.imagePosition = CJButtonImagePositionLeft;
    radioButton.imageView.image = [UIImage imageNamed:@"checkedYES"];
    
    radioButton.backgroundColor = [UIColor cyanColor];
    radioButton.textNormalColor = [UIColor whiteColor];
    radioButton.textSelectedColor = [UIColor blackColor];
    
    return radioButton;
}

- (void)cj_buttonControllerView:(CJRadioButtonCycleComposeView *)buttonControllerView didChangeToIndex:(NSInteger)index {
    NSLog(@"didChangeToIndex = %ld", index);
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
