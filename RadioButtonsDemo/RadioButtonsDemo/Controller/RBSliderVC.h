//
//  RBSliderVC.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"

@interface RBSliderVC : UIViewController<RadioButtonsDelegate>{
    
}
@property (nonatomic, weak) IBOutlet RadioButtons *sliderRadioButtons;
@property (nonatomic, weak) IBOutlet RadioButtons *sliderRadioButtons2;

@end
