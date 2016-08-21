//
//  UIView+CJShowDropView.h
//  RadioButtonsDemo
//
//  Created by 李超前 on 16/8/21.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^CJTapViewTappedAction)(UIView *view);

@interface UIView (CJShowDropView)

@property (nonatomic, strong) UIView *cjExtendView;
@property (nonatomic, strong) UIView *cjShowInView;
@property (nonatomic, strong) UIView *cjTapView;

@property (nonatomic, copy) CJTapViewTappedAction cjTapViewTappedAction;


/**
 *  显示弹出下拉视图
 *
 *  @param extendView    弹出视图
 *  @param showInVIew    弹出视图被add到的view
 *  @param completeBlock 弹出成功后执行的操作
 */
- (void)cj_showDropDownExtendView:(UIView *)extendView withShowInView:(UIView *)showInVIew completeBlock:(void(^)(void))completeBlock;

/**
 *  隐藏弹出视图
 */
- (void)cj_hideDropDownExtendView;

@end
