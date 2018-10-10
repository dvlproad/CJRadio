//
//  CycleComposeViewController.h
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJCycleComposeView.h"

@interface CycleComposeViewController : UIViewController {
    
}

@property (nonatomic, weak) IBOutlet CJCycleComposeView *cycleComposeView;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;

@end
