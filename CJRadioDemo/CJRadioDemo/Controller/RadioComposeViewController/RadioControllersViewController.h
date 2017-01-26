//
//  RadioControllersViewController.h
//  CJRadioDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioComposeView.h"

@interface RadioControllersViewController : UIViewController {
    
}

@property (nonatomic, weak) IBOutlet RadioComposeView *radioComposeView;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;

@end
