//
//  RadioControllersViewController.h
//  RadioControllersDemo
//
//  Created by 李超前 on 16/8/26.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioComposeView.h"

@interface RadioControllersViewController : UIViewController {
    
}

@property (nonatomic, weak) IBOutlet RadioComposeView *radioComposeView;

//@property (nonatomic, strong) NSMutableArray *radioControllers;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;

@end
