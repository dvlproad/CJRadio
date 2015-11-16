//
//  UIView+ShowPopupInView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShowPopupInView)

@property (nonatomic, retain) UIView *popupView_show;


- (void)showPopupView:(UIView *)popupView InView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_popupView showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide;

- (void)showPopupInView_dismissPopupViewAnimated:(BOOL)animated;

@end
