//
//  SystemComposeViewController.m
//  RadioComposeViewDemo
//
//  Created by 李超前 on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "SystemComposeViewController.h"
#import "TestDataUtil.h"
#import <PureLayout/PureLayout.h>

@interface SystemComposeViewController () <RadioButtonsDelegate> {
    
}
@property (nonatomic, strong) CJCommonRadioButtonsDataSource *radioButtonsDataSource;

@end

@implementation SystemComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"SystemComposeViewController首页", nil);
    
    NSArray *titles = [TestDataUtil getComponentTitles];
    
    self.sliderRadioButtons = [[RadioButtons alloc] init];
    [self.sliderRadioButtons commonSetupWithType:CJCommonRadioButtonTypeSlider];
    
    self.radioButtonsDataSource =
    [[CJCommonRadioButtonsDataSource alloc] initWithTitles:titles
                                          defaultShowIndex:0
                                        maxButtonShowCount:titles.count
                                     commonRadioButtonType:CJCommonRadioButtonTypeSlider];
    self.sliderRadioButtons.dataSource = self.radioButtonsDataSource;
    self.sliderRadioButtons.delegate = self;
    
    
    
    self.radioComposeView = [[UIView alloc] init];
    self.componentViewControllers = [TestDataUtil getComponentViewControllers];
    
    [self.view addSubview:self.sliderRadioButtons];
    [self.sliderRadioButtons autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(64, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [self.sliderRadioButtons autoSetDimension:ALDimensionHeight toSize:44];
    
    [self.view addSubview:self.radioComposeView];
    [self.radioComposeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sliderRadioButtons withOffset:0];
    [self.radioComposeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
}

#pragma mark - RadioButtonsDataSource & RadioButtonsDelegate
- (void)cj_radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    
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
