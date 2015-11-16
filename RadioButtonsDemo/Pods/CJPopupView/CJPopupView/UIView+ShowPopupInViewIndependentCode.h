//
//  UIView+ShowPopupInViewIndependentCode.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShowPopupInViewIndependentCode) //Independent可独立的代码，没引用其他类或类别,这里特指没引用#include "UIView+PopupInView.h"

@property (nonatomic, retain) UIView *showPopupInViewIndependentCode_lowestSuperviewLocation;//最底层的supverview
@property (nonatomic, copy) void(^showPopupInViewIndependentCode_blockTapBGComplete)(void);
@property (nonatomic, copy) void(^showPopupInViewIndependentCode_blockHideComplete)(void);


- (void)showPopupViewIndependentCode:(UIView *)popupView InView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_popupView showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide;

- (void)showPopupInViewIndependentCode_dismissPopupViewAnimated:(BOOL)animated;

@end
