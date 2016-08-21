//
//  RBDropDownVC.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"
#import "UIView+CJShowDropView.h"

@interface RBDropDownVC : UIViewController<RadioButtonsDelegate>{
    RadioButtons *rb_dropdown;
    RadioButtons *rb_dropdown2;
    UIView *popupView1;
    UIView *popupView2;
    UIView *popupView3;
    UIView *popupView4;
}

@end
