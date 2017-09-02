//
//  SliderViewController.h
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJRadioButtons.h"
#import "CJCycleComposeView.h"

@interface SliderViewController : UIViewController {
    
}
@property (nonatomic, strong) CJRadioButtons *sliderRadioButtons;
@property (nonatomic, strong) CJCycleComposeView *cycleComposeView;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, assign) NSInteger maxRadioButtonsShowViewCount;

@property (nonatomic, assign) NSInteger currentSelectedIndex;

//- (void)reloadData;   //TODO: 用于类似栏目变更操作

@end
