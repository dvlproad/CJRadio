//
//  CJPopupView.h
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//


#import "UIView+PopupInWindow.h"

#import "UIView+PopupInView.h"
//注意点：使用popupInView必须保证执行popupInView:的实例是同一个，所以需要将要popup的view设置为全局变量，否则重复点击会出现错误

#import "UIView+ShowPopupInView.h"      //引用到"UIView+PopupInView.h"
#import "UIView+ShowHisDropDownView.h"  //引用到"UIView+ShowPopupInView.h"


/*
 当前view中的某个point在toView中对应的位置是多少的计算方法
 方法介绍：- (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
 //第一个参数必须为所要转化的rect的视图的父视图，这里可以将父视图直接写出，也可用该视图的superview来替代，这样更方便
 
 */