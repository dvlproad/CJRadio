//
//  RBDropDownVC.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"
#import <CJPopupAction/UIView+CJShowExtendView.h>

@interface RBDropDownVC : UIViewController<RadioButtonsDelegate>{
    UIView *popupView1;
    UIView *popupView2;
    UIView *popupView3;
    UIView *popupView4;
}
@property (nonatomic, weak) IBOutlet RadioButtons *dropdownRadioButtons;
@property (nonatomic, weak) IBOutlet RadioButtons *dropdownRadioButtons2;

@end
