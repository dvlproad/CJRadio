//
//  UIView+PopupDropDownView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+PopupDropDownView.h"
#import <objc/runtime.h>

#define kTagExtendView  8881
#define kTagTapV        8882

@implementation UIView (PopupDropDownView)
@dynamic lowestSuperviewLocation;

- (UIView *)lowestSuperviewLocation{
    return objc_getAssociatedObject(self, @"lowestSuperviewLocation");
}

- (void)setLowestSuperviewLocation:(UIView *)lowestSuperviewLocation{
    objc_setAssociatedObject(self, @"lowestSuperviewLocation", lowestSuperviewLocation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)hideCurrentExtendView{
    UIView *extendView = [self.lowestSuperviewLocation viewWithTag:kTagExtendView];
    UIView *tapV = [self.lowestSuperviewLocation viewWithTag:kTagTapV];

    CGRect rect = extendView.frame;
    rect.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        tapV.alpha = 1.0f;
        extendView.alpha = 1.0f;
        
        //要设置成0，不设置非零值如0.2，是为了防止在显示出来的时候，在0.3秒内很快按两次按钮，仍有view存在
        tapV.alpha = 0.0f;
        extendView.alpha = 0.0f;
        
        extendView.frame = rect;
    }completion:^(BOOL finished) {
        [extendView removeFromSuperview];
        [tapV removeFromSuperview];
    }];
}



- (void)popupDropDownView:(UIView *)extendView_m inLowestSuperview:(UIView *)lowestSuperview complete:(void(^)(void))block{
    
//    UIView *popupView = [keywindow viewWithTag:kCJPopupViewTag];
//    UIView *overlay = [keywindow viewWithTag:kCJOverlayViewTag];
    
    UIView *extendView = [self.lowestSuperviewLocation viewWithTag:kTagExtendView];
    UIView *tapV = [self.lowestSuperviewLocation viewWithTag:kTagTapV];
    
    if (extendView) {
        [extendView removeFromSuperview];
        [tapV removeFromSuperview];
    }
    
    self.lowestSuperviewLocation = lowestSuperview;
    
    //执行隐藏的手势视图
    extendView = extendView_m;
    
    extendView.tag = kTagExtendView;
    
    
    //radioButtons在superView中对应的y、rect值为：
    CGRect rectInSuperView_self = [self.superview convertRect:self.frame toView:self.lowestSuperviewLocation];
    //第一个参数必须为所要转化的rect的视图的父视图，这里可以将父视图直接写出，也可用该视图的superview来替代，这样更方便
    //NSLog(@"rectInSuperView_self = %@", NSStringFromCGRect(rectInSuperView_self));
    
    CGFloat x = self.frame.origin.x;
    CGFloat y = rectInSuperView_self.origin.y + self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    if (!tapV) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction:)];
        
        CGFloat h = self.lowestSuperviewLocation.frame.size.height - self.frame.origin.y - self.frame.size.height;
        
        tapV = [[UIView alloc] initWithFrame:CGRectMake(x, y , w, h)];
        tapV.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        tapV.tag = kTagTapV;
        [tapV addGestureRecognizer:tapGesture];
    }
    [self.lowestSuperviewLocation addSubview:tapV];
    
    x = extendView_m.frame.origin.x;
    w = extendView_m.frame.size.width;
    
    CGFloat h_extendView = extendView.frame.size.height;
    CGRect rect = CGRectMake(x, y, w, 0);
    extendView.frame = rect;
    [self.lowestSuperviewLocation addSubview:extendView];
    
    //动画设置位置
    [UIView animateWithDuration:0.3 animations:^{
        tapV.alpha = 0.2;
        extendView.alpha = 0.2;
        
        tapV.alpha = 1.0;
        extendView.alpha = 1.0;
        
        CGRect rect_extendView = extendView.frame;
        rect_extendView.size.height = h_extendView;
        extendView.frame = rect_extendView;
    }];
    
    if(block){
        block();
    }
}

- (void)bgTappedAction:(UITapGestureRecognizer *)tap{
    [self hideCurrentExtendView];
}


@end
