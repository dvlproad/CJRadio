//
//  UIView+PopupInView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+PopupInView.h"
#import <objc/runtime.h>

#define kTagTapV        (self.tag + 8882)   //技巧：为避免每个弹出框的点击背景的tag一样，这里加上self.tag

@implementation UIView (PopupInView)

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
- (void)popupInView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_self complete:(void(^)(void))block{
    
    self.lowestSuperviewLocation = overlay;;
    
    UIView *tapV = [self.lowestSuperviewLocation viewWithTag:kTagTapV];
    if (tapV) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        [self removeFromSuperview];
        [tapV removeFromSuperview];
    }else{
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction_popupInView:)];
        tapV = [[UIView alloc] initWithFrame:CGRectZero];
        tapV.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        tapV.tag = kTagTapV;
        [tapV addGestureRecognizer:tapGesture];
    }
    [self.lowestSuperviewLocation addSubview:tapV];
    [self.lowestSuperviewLocation addSubview:self];
    
    
    CGFloat x = locationPoint.x;
    CGFloat y_self = locationPoint.y;
    CGFloat y_tapV = locationPoint.y;
    CGFloat w = size_self.width;
    
    CGFloat h_self_show = size_self.height;
    CGFloat h_self_hide = 0;
    CGFloat h_tapV = self.lowestSuperviewLocation.frame.size.height - y_tapV;
    
    CGRect rect_self_hide = CGRectMake(x, y_self, w, h_self_hide);
    CGRect rect_self_show = CGRectMake(x, y_self, w, h_self_show);
    CGRect rect_tapV = CGRectMake(x, y_tapV , w, h_tapV);
    
    //动画设置
    [tapV setFrame:rect_tapV];
    [self setFrame:rect_self_hide];
    [UIView animateWithDuration:0.3 animations:^{
        tapV.alpha = 0.2;
        self.alpha = 0.2;
        
        tapV.alpha = 1.0;
        self.alpha = 1.0;
    
        [self setFrame:rect_self_show];
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
- (void)bgTappedAction_popupInView:(UITapGestureRecognizer *)tap{
    //先block_TapBGComplete，再hideCurrentExtendView,顺序反了容易造成错误
    if (self.block_TapBGComplete) {
        self.block_TapBGComplete();
    }
    
    [self dismissPopupView_popupInView];
}

#pragma mark - 隐藏DropDownView的方法
- (void)dismissPopupView_popupInView{
    if (self.lowestSuperviewLocation == nil) {
        NSLog(@"Error: 请检查是否是重新生成了popupView，而导致self.lowestSuperviewLocation == nil");
        return;
    }
    
    UIView *tapV = [self.lowestSuperviewLocation viewWithTag:kTagTapV];
    
    CGRect rect_self_hide = self.frame;//此时rect_self_hide = rect_self_show;
    rect_self_hide.size.height = 0;
//    [UIView animateWithDuration:0.3 animations:^{
//        tapV.alpha = 1.0f;
//        self.alpha = 1.0f;
//        
//        //要设置成0，不设置非零值如0.2，是为了防止在显示出来的时候，在0.3秒内很快按两次按钮，仍有view存在
//        tapV.alpha = 0.0f;
//        self.alpha = 0.0f;
    
        [self setFrame:rect_self_hide];
        
//    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        [tapV removeFromSuperview];
//    }];
    
    if (self.block_HideComplete) {
        self.block_HideComplete();
    }
}


@end
