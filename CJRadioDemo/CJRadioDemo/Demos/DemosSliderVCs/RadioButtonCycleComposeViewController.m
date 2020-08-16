//
//  RadioButtonCycleComposeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "RadioButtonCycleComposeViewController.h"
#import "CustomSliderVCElementFactory.h"

@interface RadioButtonCycleComposeViewController () <CJButtonControllerViewDataSource, CJButtonControllerViewDelegate>

@end

@implementation RadioButtonCycleComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"RadioButtons + CycleComposeView", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect navigationBarFrame = self.navigationController.navigationBar.bounds;
    CGFloat navigationBarHeight = CGRectGetHeight(navigationBarFrame);
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = CGRectGetHeight(statusBarFrame);  //20或44
    CGFloat topHeight = navigationBarHeight + statusBarHeight;
    
    CJRadioButtonCycleComposeView *radioButtonCycleComposeView = [CustomSliderVCElementFactory demoRadioButtonCycleComposeView];
    radioButtonCycleComposeView.radioModules = [CustomSliderVCElementFactory demoRadioModules];
    radioButtonCycleComposeView.componentViewParentViewController = self;
    radioButtonCycleComposeView.dataSource = self;
    radioButtonCycleComposeView.delegate = self;
    [self.view addSubview:radioButtonCycleComposeView];
    [radioButtonCycleComposeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(topHeight);
        make.bottom.mas_equalTo(self.view);
    }];
    self.radioButtonCycleComposeView = radioButtonCycleComposeView;
    
    [self.radioButtonCycleComposeView reloadData];
}

//一定不要漏了这个滚动操作
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.radioButtonCycleComposeView scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark - CJButtonControllerViewDataSource && CJButtonControllerViewDelegate
- (CJRadioButton *)cj_buttonControllerView:(CJRadioButtonCycleComposeView *)buttonControllerView cellForComponentAtIndex:(NSInteger)index {
    CJRadioButton *radioButton = [CustomSliderVCElementFactory demoRadioButton];
    
    return radioButton;
}

- (void)cj_buttonControllerView:(CJRadioButtonCycleComposeView *)buttonControllerView didChangeToIndex:(NSInteger)index {
    NSLog(@"---------------------");
    //NSLog(@"didChangeToIndex = %ld", index);
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
