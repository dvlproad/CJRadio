//
//  UIView+ShowHisDropDownView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+ShowHisDropDownView.h"
#import "UIView+ShowPopupInView.h"

@implementation UIView (ShowHisDropDownView)

- (void)showHisDropDownView:(UIView *)popupView inView:(UIView *)popupSuperview withHeight:(CGFloat)h_popupView showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide{
    
    UIView *sender = self;
    
    CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
    CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
    CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
    
    [sender showPopupView:popupView InView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView showComplete:block_Show tapBGComplete:block_TapBG hideComplete:block_Hide];
}

- (void)showHisDropDownView_dismissPopupViewAnimated:(BOOL)animated{
    UIView *sender = self;
    
    [sender showPopupInView_dismissPopupViewAnimated:animated];
}

@end
