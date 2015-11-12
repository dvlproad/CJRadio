//
//  UIView+PopupDropDownView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PopupDropDownView)

@property (nonatomic, retain) UIView *lowestSuperviewLocation;//最底层的supverview
- (void)popupDropDownView:(UIView *)extendView_m inLowestSuperview:(UIView *)lowestSuperview complete:(void(^)(void))block;

@end
