//
//  UIView+CJShowDropView.m
//  CJPopupViewDemo
//
//  Created by 李超前 on 16/8/21.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "UIView+CJShowDropView.h"

static NSString *cjExtendViewKey = @"cjExtendView";
static NSString *cjShowInViewKey = @"cjShowInView";
static NSString *cjTapViewKey = @"cjTapView";

static NSString *cjTapViewTappedActionKey = @"cjTapViewTappedAction";

static NSString *cjExtendViewShowingKey = @"cjExtendViewShowing";


@implementation UIView (CJShowDropView)

#pragma mark - runtime
//cjExtendView
- (UIView *)cjExtendView {
    return objc_getAssociatedObject(self, &cjExtendViewKey);
}

- (void)setCjExtendView:(UIView *)cjExtendView {
    return objc_setAssociatedObject(self, &cjExtendViewKey, cjExtendView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//cjShowInView
- (UIView *)cjShowInView {
    return objc_getAssociatedObject(self, &cjShowInViewKey);
}

- (void)setCjShowInView:(UIView *)cjShowInView {
    return objc_setAssociatedObject(self, &cjShowInViewKey, cjShowInView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//cjTapView
- (UIView *)cjTapView {
    return objc_getAssociatedObject(self, &cjTapViewKey);
}

- (void)setCjTapView:(UIView *)cjTapView {
    return objc_setAssociatedObject(self, &cjTapViewKey, cjTapView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//cjTapViewTappedAction
- (CJTapViewTappedAction)cjTapViewTappedAction {
    return objc_getAssociatedObject(self, &cjTapViewTappedActionKey);
}

- (void)setCjTapViewTappedAction:(CJTapViewTappedAction)cjTapViewTappedAction {
    return objc_setAssociatedObject(self, &cjTapViewTappedActionKey, cjTapViewTappedAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//cjExtendViewShowing
- (BOOL)isCJExtendViewShowing {
    return [objc_getAssociatedObject(self, &cjExtendViewShowingKey) boolValue];
}

- (void)setCjExtendViewShowing:(BOOL)cjExtendViewShowing {
    return objc_setAssociatedObject(self, &cjExtendViewShowingKey, @(cjExtendViewShowing), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - <#Section#>
/** 完整的描述请参见文件头部 */
- (void)cj_showDropDownExtendView:(UIView *)extendView withShowInView:(UIView *)showInVIew completeBlock:(void(^)(void))completeBlock {
    
    self.cjExtendViewShowing = YES;
    
    if (self.cjExtendView) {
        [self.cjExtendView removeFromSuperview];
        [self.cjTapView removeFromSuperview];
    }
    
    
    //执行隐藏的手势视图
    self.cjExtendView = extendView;
    self.cjShowInView = showInVIew;
    
    
    //radioButtons在superView中对应的y、rect值为：
    CGRect rectInSuperView_self = [self.superview convertRect:self.frame toView:showInVIew];
    //第一个参数必须为所要转化的rect的视图的父视图，这里可以将父视图直接写出，也可用该视图的superview来替代，这样更方便
    //NSLog(@"rectInSuperView_self = %@", NSStringFromCGRect(rectInSuperView_self));
    
    CGFloat x = self.frame.origin.x;
    CGFloat y = rectInSuperView_self.origin.y + self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    if (!self.cjTapView) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cj_TapViewTappedAction:)];
        
        CGFloat h = self.cjShowInView.frame.size.height - self.frame.origin.y - self.frame.size.height;
        
        self.cjTapView = [[UIView alloc] initWithFrame:CGRectMake(x, y , w, h)];
        self.cjTapView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        [self.cjTapView addGestureRecognizer:tapGesture];
    }
    [self.cjShowInView addSubview:self.cjTapView];
    
    x = extendView.frame.origin.x;
    w = extendView.frame.size.width;
    
    CGFloat h_extendView = self.cjExtendView.frame.size.height;
    CGRect rect = CGRectMake(x, y, w, 0);
    self.cjExtendView.frame = rect;
    [self.cjShowInView addSubview:self.cjExtendView];
    
    //动画设置位置
    [UIView animateWithDuration:0.3 animations:^{
        self.cjTapView.alpha = 0.2;
        self.cjExtendView.alpha = 0.2;
        
        self.cjTapView.alpha = 1.0;
        self.cjExtendView.alpha = 1.0;
        
        CGRect rect_extendView = self.cjExtendView.frame;
        rect_extendView.size.height = h_extendView;
        self.cjExtendView.frame = rect_extendView;
    }];
    
    if(completeBlock){
        completeBlock();
    }
}

- (void)cj_TapViewTappedAction:(UITapGestureRecognizer *)tap {
    if (self.cjTapViewTappedAction) {
        self.cjTapViewTappedAction(self);
    } else {
        NSLog(@"未设置cjTapViewTappedAction");
    }
}


/** 完整的描述请参见文件头部 */
- (void)cj_hideDropDownExtendView {
    self.cjExtendViewShowing = NO;  //设置成NO表示当前未显示任何弹出视图
    
    CGRect rect = self.cjExtendView.frame;
    rect.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.cjTapView.alpha = 1.0f;
        self.cjExtendView.alpha = 1.0f;
        
        //要设置成0，不设置非零值如0.2，是为了防止在显示出来的时候，在0.3秒内很快按两次按钮，仍有view存在
        self.cjTapView.alpha = 0.0f;
        self.cjExtendView.alpha = 0.0f;
        
        self.cjExtendView.frame = rect;
    }completion:^(BOOL finished) {
        [self.cjExtendView removeFromSuperview];
        [self.cjTapView removeFromSuperview];
    }];
}

@end
