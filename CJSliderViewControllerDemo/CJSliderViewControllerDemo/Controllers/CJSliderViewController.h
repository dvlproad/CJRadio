//
//  CJSliderViewController.h
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"
#import "RadioControllers.h"

@interface CJSliderViewController : UIViewController {
    
}
@property (nonatomic, strong) IBOutlet RadioButtons *radioButtons;
@property (nonatomic, strong) IBOutlet RadioControllers *radioControllersView;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, assign) NSInteger maxRadioButtonsShowViewCount;

@property (nonatomic, assign) NSInteger currentSelectedIndex;

//- (void)reloadData;   //TODO: 用于类似栏目变更操作

@end
