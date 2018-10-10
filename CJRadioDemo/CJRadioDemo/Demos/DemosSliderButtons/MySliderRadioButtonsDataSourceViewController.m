//
//  MySliderRadioButtonsDataSourceViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "MySliderRadioButtonsDataSourceViewController.h"
#import "TestDataUtil.h"
#import "MySliderRadioButtonsDataSource.h"
#import <objc/runtime.h>

#define kDefaultMaxShowCount   4

@interface MySliderRadioButtonsDataSourceViewController () <CJRadioButtonsDelegate> {
    
}
@property (nonatomic, strong) MySliderRadioButtonsDataSource *sliderRadioButtonsDataSource;

@end

@implementation MySliderRadioButtonsDataSourceViewController

//一定不要漏了这个滚动操作
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.sliderRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
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
    
    //NSArray *titles = [TestDataUtil getViewControllerTitles];
    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6", @"Home7", @"Home8", @"Home9", @"Home10", @"Home11", @"Home12", @"Home13", @"Home14", @"Home15"];
    self.sliderRadioButtonsDataSource = [[MySliderRadioButtonsDataSource alloc] init];
    self.sliderRadioButtonsDataSource.titles = titles;
    self.sliderRadioButtonsDataSource.defaultSelectedIndex = 1;
    self.sliderRadioButtonsDataSource.maxButtonShowCount = kDefaultMaxShowCount;
    
    //sliderRadioButtonsSample
//    CJRadioButtons *sliderRadioButtons = [[CJRadioButtons alloc] init];
    CJRadioButtons *sliderRadioButtons = self.sliderRadioButtons;
    sliderRadioButtons.dataSource = self.sliderRadioButtonsDataSource;
    sliderRadioButtons.delegate = self;
    sliderRadioButtons.backgroundColor = [UIColor cyanColor];
    sliderRadioButtons.hideSeparateLine = YES;
    sliderRadioButtons.showBottomLineView = YES;
    sliderRadioButtons.bottomLineImage = [UIImage imageNamed:@"arrowUp_white"];
    sliderRadioButtons.bottomLineColor = [UIColor clearColor];
    sliderRadioButtons.bottomLineViewHeight = 4;
    [sliderRadioButtons addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                            withArrowImageWidth:20];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //耗时的操作
        sleep(2);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新界面
            [self.sliderRadioButtons cj_selectComponentAtIndex:0 animated:YES];
        });
    });
}

#pragma mark -  CJRadioButtonsDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
}





- (IBAction)testReloadView:(id)sender {
    NSArray *newTitles = @[@"News1第一页", @"News2", @"News3", @"News4天赐的爱", @"News5你是礼物", ];
    self.sliderRadioButtonsDataSource.titles = newTitles;
    self.sliderRadioButtonsDataSource.defaultSelectedIndex = 2;
    //self.sliderRadioButtonsDataSource.maxButtonShowCount = kDefaultMaxShowCount;
    
    self.sliderRadioButtons.hideSeparateLine = NO;
    [self.sliderRadioButtons reloadViews];
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
