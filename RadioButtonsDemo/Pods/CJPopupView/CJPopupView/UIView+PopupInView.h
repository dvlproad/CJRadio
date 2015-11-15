//
//  UIView+PopupInView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PopupInView)

@property (nonatomic, retain) UIView *lowestSuperviewLocation;//最底层的supverview
@property (nonatomic, copy) void(^block_TapBGComplete)(void);
@property (nonatomic, copy) void(^block_HideComplete)(void);


- (void)popupInView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_self complete:(void(^)(void))block;
- (void)setBlockTapBGComplete:(void(^)(void))block_TapBGComplete_m blockHideDropDownViewComplete:(void(^)(void))block_HideComplete_m;

- (void)dismissPopupView_popupInView;//隐藏DropDownView的方法

@end
