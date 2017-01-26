//
//  CJSystemComposeViewController.h
//  CJRadioDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJSystemComposeViewController : UIViewController {
    
}

@property (nonatomic, strong) NSArray *componentViewControllers;
@property (nonatomic, assign) NSInteger currentSelectedIndex;

@property (nonatomic, strong) IBOutlet UIView *radioComposeView;
@property (nonatomic, assign) NSInteger defaultSelectedIndex;

- (void)cj_chooseViewControllerIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old completeBlock:(void(^)(NSInteger index_cur))completeBlock;//用来调用的，而不是用来重写的

#pragma mark - addSubView
- (void)cj_makeView:(UIView *)superView addSubView:(UIView *)subView withEdgeInsets:(UIEdgeInsets)edgeInsets;

@end
