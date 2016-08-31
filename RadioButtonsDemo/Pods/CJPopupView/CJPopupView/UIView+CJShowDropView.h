//
//  UIView+CJShowDropView.h
//  CJPopupViewDemo
//
//  Created by 李超前 on 16/8/21.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^CJTapViewTappedAction)(UIView *view);

@interface UIView (CJShowDropView)

@property (nonatomic, strong) UIView *cjExtendView; /**< 弹出视图 */
@property (nonatomic, strong) UIView *cjShowInView; /**< 弹出视图被add到的view */
@property (nonatomic, strong) UIView *cjTapView;    /**< 空白区域 */

@property (nonatomic, copy) CJTapViewTappedAction cjTapViewTappedAction;    /**< 点击空白区域执行的操作 */

@property (nonatomic, assign, getter=isCJExtendViewShowing) BOOL cjExtendViewShowing;   /**< 判断当前是否有弹出视图显示 */


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
