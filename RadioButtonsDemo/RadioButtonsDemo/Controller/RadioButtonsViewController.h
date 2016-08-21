//
//  RadioButtonsViewController.h
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/12.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons_Slider.h"
#import "RadioButtons.h"

@interface RadioButtonsViewController : UIViewController <RadioButtonsDelegate> {
    RadioButtons *rbs;
    
    NSArray *radioButtonNames;
    NSString *radioButtonNidName;
    NSInteger selectIndex;
}
@property (nonatomic, strong) IBOutlet RadioButtons_Slider *radioButtons;

@end
