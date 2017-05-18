//
//  SystemComposeViewController.m
//  CJRadioDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "SystemComposeViewController.h"
#import "TestDataUtil.h"
#import <PureLayout/PureLayout.h>

@interface SystemComposeViewController () <RadioButtonsDelegate> {
    
}

@end

@implementation SystemComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"SystemComposeViewController首页", nil);
    
    NSArray *titles = [TestDataUtil getComponentTitles];
    
    CJRadioButtons *sliderRadioButtonsSample = [[CJRadioButtons alloc] init];
//    [sliderRadioButtonsSample setupWithTitles:titles defaultShowIndex:0 maxButtonShowCount:titles.count];
    sliderRadioButtonsSample.delegate = self;
    [self.view addSubview:sliderRadioButtonsSample];
    [sliderRadioButtonsSample autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(64, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [sliderRadioButtonsSample autoSetDimension:ALDimensionHeight toSize:44];
    
    self.sliderRadioButtons = sliderRadioButtonsSample;
    
    
    
    
    self.composeView = [[UIView alloc] init];
    self.componentViewControllers = [TestDataUtil getComponentViewControllers];
    [self.view addSubview:self.composeView];
    [self.composeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sliderRadioButtons withOffset:0];
    [self.composeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
}

#pragma mark - RadioButtonsDataSource & RadioButtonsDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    
    [self cj_chooseViewControllerIndex:index_cur oldIndex:index_old completeBlock:^(NSInteger index_cur) {
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
