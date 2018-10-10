//
//  SystemComposeViewController.h
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <CJBaseUIKit/UIViewController+CJSystemComposeView.h>
#import "CJRadioButtons.h"

@interface SystemComposeViewController : UIViewController {
    
}
@property (nonatomic, strong) CJRadioButtons *sliderRadioButtons;
//@property (nonatomic, strong) MySliderRadioButtonsDataSource *sliderRadioButtonsDataSource;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
@property (nonatomic, assign) NSInteger maxButtonShowCount; /**< 显示区域显示的个数超过多少就开始滑动 */

@end
