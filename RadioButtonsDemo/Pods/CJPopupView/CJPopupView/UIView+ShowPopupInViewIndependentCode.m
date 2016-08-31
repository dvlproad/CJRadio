//
//  UIView+ShowPopupInViewIndependentCode.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/16.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+ShowPopupInViewIndependentCode.h"
#import <objc/runtime.h>


//技巧：为避免每个弹出框的点击背景的tag一样，这里加上self.tag
#define kTagPopupView_ShowPopupInView   (self.tag + 8881)
#define kTagTapV_ShowPopupInView        (self.tag + 8882)

@implementation UIView (ShowPopupInViewIndependentCode)

#pragma mark - 在类别中添加属性
@dynamic showPopupInViewIndependentCode_lowestSuperviewLocation;
@dynamic showPopupInViewIndependentCode_blockTapBGComplete;
@dynamic showPopupInViewIndependentCode_blockHideComplete;


//添加属性:showPopupInViewIndependentCode_lowestSuperviewLocation
- (UIView *)showPopupInViewIndependentCode_lowestSuperviewLocation{
    return objc_getAssociatedObject(self, @"showPopupInViewIndependentCode_lowestSuperviewLocation");
}

- (void)setShowPopupInViewIndependentCode_lowestSuperviewLocation:(UIView *)showPopupInViewIndependentCode_lowestSuperviewLocation{
    objc_setAssociatedObject(self, @"showPopupInViewIndependentCode_lowestSuperviewLocation", showPopupInViewIndependentCode_lowestSuperviewLocation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//添加属性:showPopupInViewIndependentCode_blockTapBGComplete
- (void (^)(void))showPopupInViewIndependentCode_blockTapBGComplete{
    return objc_getAssociatedObject(self, @"showPopupInViewIndependentCode_blockTapBGComplete");
}

- (void)setShowPopupInViewIndependentCode_blockTapBGComplete:(void (^)(void))showPopupInViewIndependentCode_blockTapBGComplete{
    objc_setAssociatedObject(self, @"showPopupInViewIndependentCode_blockTapBGComplete", showPopupInViewIndependentCode_blockTapBGComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//添加属性:showPopupInViewIndependentCode_blockHideComplete
- (void (^)(void))showPopupInViewIndependentCode_blockHideComplete{
    return objc_getAssociatedObject(self, @"showPopupInViewIndependentCode_blockHideComplete");
}

- (void)setShowPopupInViewIndependentCode_blockHideComplete:(void (^)(void))showPopupInViewIndependentCode_blockHideComplete{
    objc_setAssociatedObject(self, @"showPopupInViewIndependentCode_blockHideComplete", showPopupInViewIndependentCode_blockHideComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - 要调用的方法
- (void)showPopupViewIndependentCode:(UIView *)popupView InView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_popupView showComplete:(void (^)(void))block_Show tapBGComplete:(void (^)(void))block_TapBG hideComplete:(void (^)(void))block_Hide{
    
    self.showPopupInViewIndependentCode_lowestSuperviewLocation = overlay;
    self.showPopupInViewIndependentCode_blockTapBGComplete = block_TapBG;
    self.showPopupInViewIndependentCode_blockHideComplete = block_Hide;
    
    UIView *tapV = [self.showPopupInViewIndependentCode_lowestSuperviewLocation viewWithTag:kTagTapV_ShowPopupInView];
    if (tapV) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        [popupView removeFromSuperview];
        [tapV removeFromSuperview];
    }else{
        popupView.tag = kTagPopupView_ShowPopupInView;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPopupInView_bgTappedAction:)];
        tapV = [[UIView alloc] initWithFrame:CGRectZero];
        tapV.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        tapV.tag = kTagTapV_ShowPopupInView;
        [tapV addGestureRecognizer:tapGesture];
    }
    [self.showPopupInViewIndependentCode_lowestSuperviewLocation addSubview:tapV];
    [self.showPopupInViewIndependentCode_lowestSuperviewLocation addSubview:popupView];
    
    
    CGFloat x = locationPoint.x;
    CGFloat y_popupView = locationPoint.y;
    CGFloat y_tapV = locationPoint.y;
    CGFloat w = size_popupView.width;
    
    CGFloat h_popupView_show = size_popupView.height;
    CGFloat h_popupView_hide = 0;
    CGFloat h_tapV = self.showPopupInViewIndependentCode_lowestSuperviewLocation.frame.size.height - y_tapV;
    
    CGRect rect_popupView_hide = CGRectMake(x, y_popupView, w, h_popupView_hide);
    CGRect rect_popupView_show = CGRectMake(x, y_popupView, w, h_popupView_show);
    CGRect rect_tapV = CGRectMake(x, y_tapV , w, h_tapV);
    
    //动画设置
    [tapV setFrame:rect_tapV];
    [popupView setFrame:rect_popupView_hide];
    [UIView animateWithDuration:0.3 animations:^{
        tapV.alpha = 0.2;
        popupView.alpha = 0.2;
        
        tapV.alpha = 1.0;
        popupView.alpha = 1.0;
        
        [popupView setFrame:rect_popupView_show];
    }];
    
    if(block_Show){
        block_Show();
    }
}


#pragma mark - 内部私有方法
- (void)showPopupInView_bgTappedAction:(UITapGestureRecognizer *)tap{
    //先block_TapBGComplete，再hideCurrentExtendView,顺序反了容易造成错误
    if (self.showPopupInViewIndependentCode_blockTapBGComplete) {
        self.showPopupInViewIndependentCode_blockTapBGComplete();
    }
    
    [self showPopupInViewIndependentCode_dismissPopupViewAnimated:YES];
}

#pragma mark - 隐藏PopupView的方法
- (void)showPopupInViewIndependentCode_dismissPopupViewAnimated:(BOOL)animated{
    if (self.showPopupInViewIndependentCode_lowestSuperviewLocation == nil) {
        NSLog(@"Error: 请检查是否是重新生成了popupView，而导致self.lowestSuperviewLocation == nil");
        return;
    }
    
    UIView *tapV = [self.showPopupInViewIndependentCode_lowestSuperviewLocation viewWithTag:kTagTapV_ShowPopupInView];
    UIView *popupView = [self.showPopupInViewIndependentCode_lowestSuperviewLocation viewWithTag:kTagPopupView_ShowPopupInView];
    
    if (animated) {
        CGRect rect_popupView_hide = self.frame;//此时rect_self_hide = rect_self_show;
        rect_popupView_hide.size.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            tapV.alpha = 1.0f;
            popupView.alpha = 1.0f;
            
            //要设置成0，不设置非零值如0.2，是为了防止在显示出来的时候，在0.3秒内很快按两次按钮，仍有view存在
            tapV.alpha = 0.0f;
            popupView.alpha = 0.0f;
            
            [popupView setFrame:rect_popupView_hide];
            
        }completion:^(BOOL finished) {
            [popupView removeFromSuperview];
            [tapV removeFromSuperview];
        }];
    }else{
        [popupView removeFromSuperview];
        [tapV removeFromSuperview];
    }
    
    
    if (self.showPopupInViewIndependentCode_blockHideComplete) {
        self.showPopupInViewIndependentCode_blockHideComplete();
    }
}

@end
