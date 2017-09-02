//
//  TestDataUtil.h
//  CJRadioDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "CJRadioModule.h"

@interface TestDataUtil : NSObject

+ (NSMutableArray<CJRadioModule *> *)getRadioModules;

+ (NSArray<UIViewController *> *)getComponentViewControllers;

+ (NSArray<NSString *> *)getComponentTitles;

@end
