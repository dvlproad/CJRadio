//
//  RBSliderVC.m
//  CJRadioDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBSliderVC.h"
#import "TestDataUtil.h"
#import "MySliderRadioButtonsDataSource.h"
#import <objc/runtime.h>

#define kDefaultMaxShowCount   4

@interface RBSliderVC () <RadioButtonsDelegate> {
    
}
@property (nonatomic, strong) MySliderRadioButtonsDataSource *sliderRadioButtonsDataSource;

@end

@implementation RBSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImage *image = [UIImage imageNamed:@"arrowRight_red"];
    self.myImageBottomButton.imagePosition = MyButtonImagePositionRight;
    self.myImageBottomButton.backgroundColor = [UIColor lightGrayColor];
    [self.myImageBottomButton setImage:image forState:UIControlStateNormal];
    [self.myImageBottomButton setTitle:@"图片在下的button" forState:UIControlStateNormal];
    
    
    
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

- (IBAction)testReloadView:(id)sender {
    NSArray *newTitles = @[@"News1第一页", @"News2", @"News3", @"News4天赐的爱", @"News5你是礼物", ];
    self.sliderRadioButtonsDataSource.titles = newTitles;
    self.sliderRadioButtonsDataSource.defaultSelectedIndex = 2;
    //self.sliderRadioButtonsDataSource.maxButtonShowCount = kDefaultMaxShowCount;
    
    self.sliderRadioButtons.hideSeparateLine = NO;
    [self.sliderRadioButtons reloadViews];
    
}

//一定不要漏了这个滚动操作
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.sliderRadioButtons scollToCurrentSelectedViewWithAnimated:NO];
}

#pragma mark -  RadioButtonsDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
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
