//
//  UIView+ShowHisDropDownView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShowHisDropDownView)

- (void)showHisDropDownView:(UIView *)popupView inView:(UIView *)popupSuperview withHeight:(CGFloat)h_popupView showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide;

- (void)showHisDropDownView_dismissPopupViewAnimated:(BOOL)animated;
@end
