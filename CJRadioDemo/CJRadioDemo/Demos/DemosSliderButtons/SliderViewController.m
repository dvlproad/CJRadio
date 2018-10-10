//
//  SliderViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "SliderViewController.h"
#import <PureLayout/PureLayout.h>
#import "DemoSliderRadioButtonsDataSource.h"
#import "SliderVCElementFactory.h"

static NSInteger kMaxRadioButtonsShowViewCountDefault = 4;
static NSInteger kSelectedIndexDefault = 1;

@interface SliderViewController () <CJRadioButtonsDelegate, CJCycleComposeViewDataSource, CJCycleComposeViewDelegate> {
    
}
@property (nonatomic, strong) DemoSliderRadioButtonsDataSource *sliderRadioButtonsDataSource;

@end

@implementation SliderViewController

- (CJRadioButtons *)createSliderRadioButtonsSample {
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"SliderViewController首页", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect navigationBarFrame = self.navigationController.navigationBar.bounds;
    CGFloat navigationBarHeight = CGRectGetHeight(navigationBarFrame);
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = CGRectGetHeight(statusBarFrame);  //20或44
    CGFloat topHeight = navigationBarHeight + statusBarHeight;
    
    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    
    //Self
    self.defaultSelectedIndex = kSelectedIndexDefault;
    self.maxRadioButtonsShowViewCount = kMaxRadioButtonsShowViewCountDefault;
    
    self.sliderRadioButtonsDataSource = [[DemoSliderRadioButtonsDataSource alloc] init];
    self.sliderRadioButtonsDataSource.titles = titles;
    self.sliderRadioButtonsDataSource.defaultSelectedIndex = kSelectedIndexDefault;
    self.sliderRadioButtonsDataSource.maxButtonShowCount = kMaxRadioButtonsShowViewCountDefault;
    
    //sliderRadioButtonsSample
    CJRadioButtons *sliderRadioButtonsSample = [[CJRadioButtons alloc] init];
    sliderRadioButtonsSample.dataSource = self.sliderRadioButtonsDataSource;
    sliderRadioButtonsSample.delegate = self;
    sliderRadioButtonsSample.hideSeparateLine = YES;
    sliderRadioButtonsSample.showBottomLineView = YES;
    sliderRadioButtonsSample.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    sliderRadioButtonsSample.bottomLineColor = [UIColor clearColor];
    sliderRadioButtonsSample.bottomLineViewHeight = 4;
    [sliderRadioButtonsSample addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                            withArrowImageWidth:20];
    
    
    [self.view addSubview:sliderRadioButtonsSample];
    [sliderRadioButtonsSample autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(topHeight, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [sliderRadioButtonsSample autoSetDimension:ALDimensionHeight toSize:44];
    
    self.sliderRadioButtons = sliderRadioButtonsSample;
    
    //RadioControllers
    self.cycleComposeView = [[CJCycleComposeView alloc] init];
    self.cycleComposeView.dataSource = self;
    self.cycleComposeView.delegate = self;
    //self.cycleComposeView.scrollType = CJCycleComposeViewScrollTypeNormal;
    [self.view addSubview:self.cycleComposeView];
    self.cycleComposeView.backgroundColor = [UIColor yellowColor];
    [self.cycleComposeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sliderRadioButtons withOffset:0];
    [self.cycleComposeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
}

//- (BOOL)automaticallyAdjustsScrollViewInsets {
//    return NO;
//}

//一定不要漏了这个滚动操作
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.sliderRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
    [self.cycleComposeView cj_scrollToCenterViewWithAnimated:NO];
}



#pragma mark - CJCycleComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInCJCycleComposeView:(CJCycleComposeView *)CJCycleComposeView {
    return self.defaultSelectedIndex;
}

- (NSArray<UIView *> *)cj_radioViewsInCJCycleComposeView:(CJCycleComposeView *)CJCycleComposeView {
    NSArray *radioViewControllers = [SliderVCElementFactory demoComponentViewControllers];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIViewController *vc in radioViewControllers) {
        [views addObject:vc.view];
        [self addChildViewController:vc];//记得添加进去
    }
    
    return views;
}

#pragma mark - CJRadioButtonsDelegate & CJCycleComposeViewDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    //NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
    [self.cycleComposeView cj_selectComponentAtIndex:index_cur animated:YES];
    self.currentSelectedIndex = index_cur;
    
    [self doSomethingToCon_whereIndex:index_cur];
}

- (void)cj_cycleComposeView:(CJCycleComposeView *)cycleComposeView didChangeToIndex:(NSInteger)index
{
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
