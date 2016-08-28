//
//  RBSliderVC.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBSliderVC.h"

@interface RBSliderVC ()

@end

@implementation RBSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self initizileDataForRadioButtons];
}

/**
 *  初始化数据（单选按钮）
 */
- (void)initizileDataForRadioButtons {
    NSArray *radioButtonNames =  @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6", @"Home7", @"Home8", @"Home9", @"Home10", @"Home11", @"Home12", @"Home13", @"Home14", @"Home15"];
    [self.sliderRadioButtons setTitles:radioButtonNames radioButtonNidName:@"RadioButton_Slider"];
    self.sliderRadioButtons.defaultSelectedIndex = 4;
    self.sliderRadioButtons.maxShowViewCount = 3;
    //    self.sliderRadioButtons.shouldMoveScrollViewToSelectItem = YES;
    
    [self.sliderRadioButtons setDelegate:self];
    [self.sliderRadioButtons addLeftArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                               rightArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                           withArrowImageWidth:20];
    
    
    [self.sliderRadioButtons2 setTitles:radioButtonNames radioButtonNidName:@"RadioButton_Slider"];
    self.sliderRadioButtons2.defaultSelectedIndex = 4;
    self.sliderRadioButtons2.maxShowViewCount = 3;
    //    self.sliderRadioButtons.shouldMoveScrollViewToSelectItem = YES;
    
    [self.sliderRadioButtons2 setDelegate:self];
    [self.sliderRadioButtons2 addLeftArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                                rightArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                            withArrowImageWidth:20];
}

//点击时候会调用如下委托：
- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    if (index_cur != index_old) {
        [radioButtons selectRadioButtonIndex:index_cur];
    }
    
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
