//
//  UIView+PopupInView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PopupInView)

@property (nonatomic, retain) UIView *popupInView_lowestSuperviewLocation;//最底层的supverview
@property (nonatomic, copy) void(^popupInView_blockTapBGComplete)(void);
@property (nonatomic, copy) void(^popupInView_blockHideComplete)(void);


- (void)popupInView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_self showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide;

//专为ShowPopupInView而扩展的animated参数，防止隐藏是否由于动画太长，而导致的问题
- (void)popupInView_dismissFromSuperViewAnimated:(BOOL)animated;

@end
