//
//  SliderViewController.m
//  CJRadioDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "SliderViewController.h"
#import "TestDataUtil.h"
#import <PureLayout/PureLayout.h>

static NSInteger kMaxRadioButtonsShowViewCountDefault = 4;
static NSInteger kSelectedIndexDefault = 1;

@interface SliderViewController () <RadioButtonsDelegate, RadioComposeViewDataSource, RadioComposeViewDelegate> {
    
}

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"SliderViewController首页", nil);

    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    
    //Self
    self.defaultSelectedIndex = kSelectedIndexDefault;
    self.maxRadioButtonsShowViewCount = kMaxRadioButtonsShowViewCountDefault;
    
    //RadioButtons
    CJRadioButtonsSliderSample *radioButtonsSliderSample = [[CJRadioButtonsSliderSample alloc] init];
    [radioButtonsSliderSample setupWithTitles:titles defaultShowIndex:kSelectedIndexDefault maxButtonShowCount:kMaxRadioButtonsShowViewCountDefault];
    radioButtonsSliderSample.delegate = self;
    [self.view addSubview:radioButtonsSliderSample];
    [radioButtonsSliderSample autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(64, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [radioButtonsSliderSample autoSetDimension:ALDimensionHeight toSize:44];
    
    self.sliderRadioButtons = radioButtonsSliderSample;
    
    //RadioControllers
    self.radioComposeView = [[RadioComposeView alloc] init];
    self.radioComposeView.dataSource = self;
    self.radioComposeView.delegate = self;
    //self.radioComposeView.scrollType = RadioComposeViewScrollTypeNormal;
    [self.view addSubview:self.radioComposeView];
    self.radioComposeView.backgroundColor = [UIColor yellowColor];
    [self.radioComposeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sliderRadioButtons withOffset:0];
    [self.radioComposeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
}

//- (BOOL)automaticallyAdjustsScrollViewInsets {
//    return NO;
//}

//一定不要漏了这个滚动操作
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.sliderRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
    [self.radioComposeView scrollToCenterViewWithAnimate:NO];
}



#pragma mark - RadioComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInRadioComposeView:(RadioComposeView *)radioComposeView {
    return self.defaultSelectedIndex;
}

- (NSArray<UIView *> *)cj_radioViewsInRadioComposeView:(RadioComposeView *)radioComposeView {
    NSArray *radioViewControllers = [TestDataUtil getComponentViewControllers];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIViewController *vc in radioViewControllers) {
        [views addObject:vc.view];
        [self addChildViewController:vc];//记得添加进去
    }
    
    return views;
}

#pragma mark - RadioButtonsDelegate & RadioComposeViewDelegate
- (void)cj_radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    //NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
    [self.radioComposeView cj_selectComponentAtIndex:index_cur animated:YES];
    self.currentSelectedIndex = index_cur;
    
    [self doSomethingToCon_whereIndex:index_cur];
}

- (void)cj_radioComposeView:(RadioComposeView *)radioComposeView didChangeToIndex:(NSInteger)index {
    [self.sliderRadioButtons cj_selectComponentAtIndex:index animated:YES];
    self.currentSelectedIndex  = index;
    
    [self doSomethingToCon_whereIndex:index];
}


#pragma mark - 子类可选的继承方法
- (void)doSomethingToCon_whereIndex:(NSInteger)index {//若有类继承自此类，子类做一些额外的操作，比如“强制刷新”的操作
    
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
