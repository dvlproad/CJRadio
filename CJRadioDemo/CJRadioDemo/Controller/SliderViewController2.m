//
//  SliderViewController2.m
//  CJRadioDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "SliderViewController2.h"
#import "TestDataUtil.h"

@interface SliderViewController2 () <CJButtonControllerViewDataSource, CJButtonControllerViewDelegate>

@end

@implementation SliderViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"SliderViewController首页", nil);
    
    NSArray *titles = [TestDataUtil getComponentTitles];
    self.buttonControllerView.titles =  titles;
    self.buttonControllerView.showBottomLineView = YES;
//    self.sliderRadioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
//    self.sliderRadioButtons.bottomLineColor = [UIColor redColor];
    self.buttonControllerView.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    self.buttonControllerView.bottomLineViewHeight = 6;
    [self.buttonControllerView addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                 rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                             withArrowImageWidth:20];
    
    self.buttonControllerView.componentViewControllers = [TestDataUtil getComponentViewControllers];
    self.buttonControllerView.componentViewParentViewController = self;
    
    self.buttonControllerView.defaultSelectedIndex = 1;
    self.buttonControllerView.maxRadioButtonsShowViewCount = 4;
    self.buttonControllerView.radioButtonsHeight = 50;
    
    self.buttonControllerView.dataSource = self;
    self.buttonControllerView.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.buttonControllerView addRadioButtonsLeftView:button withWidth:60];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.buttonControllerView addRadioButtonsRightView:rightButton withWidth:40];
    
    [self.buttonControllerView reloadData];
}

//一定不要漏了这个滚动操作
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.buttonControllerView scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark - CJButtonControllerViewDataSource && CJButtonControllerViewDelegate
- (RadioButton *)cj_buttonControllerView:(CJButtonControllerView *)buttonControllerView cellForComponentAtIndex:(NSInteger)index {
    NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"RadioButton_Slider" owner:nil options:nil];
    RadioButton *radioButton = [radioButtonNib lastObject];
    
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor whiteColor];
    
    return radioButton;
}

- (void)cj_buttonControllerView:(CJButtonControllerView *)buttonControllerView didChangeToIndex:(NSInteger)index {
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
