//
//  RBSliderVC.m
//  CJRadioDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBSliderVC.h"
#import "TestDataUtil.h"

#define kDefaultMaxShowCount   4

@interface RBSliderVC () <RadioButtonsDelegate> {
    
}

@end

@implementation RBSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //NSArray *titles = [TestDataUtil getViewControllerTitles];
    NSArray *titles = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6", @"Home7", @"Home8", @"Home9", @"Home10", @"Home11", @"Home12", @"Home13", @"Home14", @"Home15"];
    
    [self.sliderRadioButtons setupWithTitles:titles defaultShowIndex:10 maxButtonShowCount:kDefaultMaxShowCount];
    self.sliderRadioButtons.hideSeparateLine = NO;
    self.sliderRadioButtons.delegate = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //耗时的操作
        sleep(2);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新界面
            [self.sliderRadioButtons cj_selectComponentAtIndex:0 animated:YES];
        });
    });
    
    
    
    
    CJRadioButtonsSliderSample *radioButtonsSliderSample = [[CJRadioButtonsSliderSample alloc] init];
    [radioButtonsSliderSample setFrame:CGRectMake(20, 400, 380, 44)];
    [radioButtonsSliderSample setupWithTitles:titles defaultShowIndex:-1 maxButtonShowCount:5];
    radioButtonsSliderSample.delegate = self;
    [self.view addSubview:radioButtonsSliderSample];
}

//一定不要漏了这个滚动操作
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.sliderRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark -  RadioButtonsDelegate
- (void)cj_radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
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
