//
//  UIView+ShowPopupInView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+ShowPopupInView.h"
#import <objc/runtime.h>

#include "UIView+PopupInView.h"

#define kTagPopupView   (self.tag + 8881)   //技巧：为避免每个弹出框的点击背景的tag一样，这里加上self.tag
#define kTagTapV        (self.tag + 8882)   //技巧：为避免每个弹出框的点击背景的tag一样，这里加上self.tag

@implementation UIView (ShowPopupInView)

#pragma mark - 在类别中添加属性
@dynamic popupView_show;

//添加属性:popupView_show
- (UIView *)popupView_show{
    return objc_getAssociatedObject(self, @"popupView_show");
}

- (void)setPopupView_show:(UIView *)popupView_show{
    objc_setAssociatedObject(self, @"popupView_show", popupView_show, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 要调用的方法
- (void)showPopupView:(UIView *)popupView InView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_popupView showComplete:(void(^)(void))block_Show tapBGComplete:(void(^)(void))block_TapBG hideComplete:(void(^)(void))block_Hide{
    
    self.popupView_show = popupView;
    [popupView popupInView:overlay atLocationPoint:locationPoint withSize:size_popupView showComplete:block_Show tapBGComplete:block_TapBG hideComplete:block_Hide];
    
    //[popupView popupInView_dismissFromSuperViewAnimated:NO];
}



#pragma mark - 隐藏PopupView的方法
- (void)showPopupInView_dismissPopupViewAnimated:(BOOL)animated{
    [self.popupView_show popupInView_dismissFromSuperViewAnimated:animated];
}

@end
