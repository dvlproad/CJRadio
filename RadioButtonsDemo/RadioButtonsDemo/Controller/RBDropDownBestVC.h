//
//  RBDropDownBestVC.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"

//notice：此例也有问题，还是得在存在popupView的时候，先隐藏再弹出

@interface RBDropDownBestVC : UIViewController<RadioButtonsDelegate>{
    RadioButtons *rb_dropdown;
}

@end
