//
//  RBDropDownVC.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons_DropDown.h"

@interface RBDropDownVC : UIViewController<RadioButtonsDelegate>{
    RadioButtons_DropDown *rb_dropdown;
    UIView *popupView1;
    UIView *popupView2;
    UIView *popupView3;
    UIView *popupView4;
}

@end
