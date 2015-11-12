//
//  UIView+PopupDropDownView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+PopupDropDownView.h"
#import <objc/runtime.h>

#define kTagExtendView  (self.tag + 8881)   //技巧：为避免每个弹出框的tag一样，这里加上self.tag
#define kTagTapV        (self.tag + 8882)

@implementation UIView (PopupDropDownView)

#pragma mark - 在类别中添加属性
@dynamic lowestSuperviewLocation;
@dynamic block_TapBGComplete;
@dynamic block_HideComplete;

//添加属性:lowestSuperviewLocation
- (UIView *)lowestSuperviewLocation{
    return objc_getAssociatedObject(self, @"lowestSuperviewLocation");
}

- (void)setLowestSuperviewLocation:(UIView *)lowestSuperviewLocation{
    objc_setAssociatedObject(self, @"lowestSuperviewLocation", lowestSuperviewLocation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//添加属性:block_TapBGComplete
- (void (^)(void))block_TapBGComplete{
    return objc_getAssociatedObject(self, @"block_TapBGComplete");
}

- (void)setBlock_TapBGComplete:(void (^)(void))block_TapBGComplete{
    objc_setAssociatedObject(self, @"block_TapBGComplete", block_TapBGComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//添加属性:block_HideComplete
- (void (^)(void))block_HideComplete{
    return objc_getAssociatedObject(self, @"block_HideComplete");
}

- (void)setBlock_HideComplete:(void (^)(void))block_HideComplete{
    objc_setAssociatedObject(self, @"block_HideComplete", block_HideComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - 要调用的方法
- (void)popupDropDownView:(UIView *)extendView_m inLowestSuperview:(UIView *)lowestSuperview complete:(void(^)(void))block{
    
    //UIView *popupView = [keywindow viewWithTag:kCJPopupViewTag];
    //UIView *overlay = [keywindow viewWithTag:kCJOverlayViewTag];
    UIView *extendView = [self.lowestSuperviewLocation viewWithTag:kTagExtendView];
    UIView *tapV = [self.lowestSuperviewLocation viewWithTag:kTagTapV];
    
    if (extendView) {
        [extendView removeFromSuperview];
        [tapV removeFromSuperview];
        extendView = nil;
        tapV = nil;
    }
    
    self.lowestSuperviewLocation = lowestSuperview;
    
    //执行隐藏的手势视图
    extendView = extendView_m;
    
    extendView.tag = kTagExtendView;
    
    
    //radioButtons在superView中对应的y、rect值为：
    CGRect rectInSuperView_self = [self.superview convertRect:self.frame toView:self.lowestSuperviewLocation];
    //第一个参数必须为所要转化的rect的视图的父视图，这里可以将父视图直接写出，也可用该视图的superview来替代，这样更方便
    //NSLog(@"rectInSuperView_self = %@", NSStringFromCGRect(rectInSuperView_self));
    
    CGFloat x = rectInSuperView_self.origin.x;
    CGFloat y = rectInSuperView_self.origin.y + self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    if (!tapV) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction_popupDropDownView:)];
        
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


- (void)setBlockTapBGComplete:(void(^)(void))block_TapBGComplete_m blockHideDropDownViewComplete:(void(^)(void))block_HideComplete_m{
    self.block_TapBGComplete = block_TapBGComplete_m;
    self.block_HideComplete = block_HideComplete_m;
}


#pragma mark - 内部私有方法
- (void)bgTappedAction_popupDropDownView:(UITapGestureRecognizer *)tap{
    //先block_TapBGComplete，再hideCurrentExtendView,顺序反了容易造成错误
    if (self.block_TapBGComplete) {
        self.block_TapBGComplete();
    }
    
    [self hideDropDownView_popupDropDownView];
}

#pragma mark - 隐藏DropDownView的方法
- (void)hideDropDownView_popupDropDownView{
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
    
    if (self.block_HideComplete) {
        self.block_HideComplete();
    }
}


@end
