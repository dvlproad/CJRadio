//
//  UIView+PopupInView.m
//  CJPopupViewDemo
//
//  Created by lichq on 15/11/12.
//  Copyright (c) 2015年 ciyouzen. All rights reserved.
//

#import "UIView+PopupInView.h"
#import <objc/runtime.h>

#define kTagTapV_PopupInView    (self.tag + 8882)   //技巧：为避免每个弹出框的点击背景的tag一样，这里加上self.tag

@implementation UIView (PopupInView)

#pragma mark - 在类别中添加属性
@dynamic popupInView_lowestSuperviewLocation;
@dynamic popupInView_blockTapBGComplete;
@dynamic popupInView_blockHideComplete;

//添加属性:popupInView_lowestSuperviewLocation
- (UIView *)popupInView_lowestSuperviewLocation{
    return objc_getAssociatedObject(self, @"popupInView_lowestSuperviewLocation");
}

- (void)setPopupInView_lowestSuperviewLocation:(UIView *)popupInView_lowestSuperviewLocation{
    objc_setAssociatedObject(self, @"popupInView_lowestSuperviewLocation", popupInView_lowestSuperviewLocation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//添加属性:popupInView_blockTapBGComplete
- (void (^)(void))popupInView_blockTapBGComplete{
    return objc_getAssociatedObject(self, @"popupInView_blockTapBGComplete");
}

- (void)setPopupInView_blockTapBGComplete:(void (^)(void))popupInView_blockTapBGComplete{
    objc_setAssociatedObject(self, @"popupInView_blockTapBGComplete", popupInView_blockTapBGComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//添加属性:popupInView_blockHideComplete
- (void (^)(void))popupInView_blockHideComplete{
    return objc_getAssociatedObject(self, @"popupInView_blockHideComplete");
}

- (void)setPopupInView_blockHideComplete:(void (^)(void))popupInView_blockHideComplete{
    objc_setAssociatedObject(self, @"popupInView_blockHideComplete", popupInView_blockHideComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - 要调用的方法
- (void)popupInView:(UIView *)overlay atLocationPoint:(CGPoint)locationPoint withSize:(CGSize)size_self showComplete:(void (^)(void))block_Show tapBGComplete:(void (^)(void))block_TapBG hideComplete:(void (^)(void))block_Hide{
    
    self.popupInView_lowestSuperviewLocation = overlay;
    self.popupInView_blockTapBGComplete = block_TapBG;
    self.popupInView_blockHideComplete = block_Hide;
    
    UIView *tapV = [self.popupInView_lowestSuperviewLocation viewWithTag:kTagTapV_PopupInView];
    if (tapV) { //tapV是指radioButtons组合下的点击区域（不包括radioButtons区域），用来点击之后隐藏列表
        [self removeFromSuperview];
        [tapV removeFromSuperview];
    }else{
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popupInView_bgTappedAction:)];
        tapV = [[UIView alloc] initWithFrame:CGRectZero];
        tapV.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        tapV.tag = kTagTapV_PopupInView;
        [tapV addGestureRecognizer:tapGesture];
    }
    [self.popupInView_lowestSuperviewLocation addSubview:tapV];
    [self.popupInView_lowestSuperviewLocation addSubview:self];
    
    
    CGFloat x = locationPoint.x;
    CGFloat y_self = locationPoint.y;
    CGFloat y_tapV = locationPoint.y;
    CGFloat w = size_self.width;
    
    CGFloat h_self_show = size_self.height;
    CGFloat h_self_hide = 0;
    CGFloat h_tapV = self.popupInView_lowestSuperviewLocation.frame.size.height - y_tapV;
    
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
    
    if(block_Show){
        block_Show();
    }
}



#pragma mark - 内部私有方法
- (void)popupInView_bgTappedAction:(UITapGestureRecognizer *)tap{
    //先block_TapBGComplete，再hideCurrentExtendView,顺序反了容易造成错误
    if (self.popupInView_blockTapBGComplete) {
        self.popupInView_blockTapBGComplete();
    }
    
    [self popupInView_dismissFromSuperViewAnimated:YES];
}

#pragma mark - 隐藏PopupView的方法
- (void)popupInView_dismissFromSuperViewAnimated:(BOOL)animated{
    if (self.popupInView_lowestSuperviewLocation == nil) {
        NSLog(@"Error: 请检查是否是重新生成了popupView，而导致self.lowestSuperviewLocation == nil");
        return;
    }
    
    UIView *tapV = [self.popupInView_lowestSuperviewLocation viewWithTag:kTagTapV_PopupInView];
    
    if (animated) {
        CGRect rect_self_hide = self.frame;//此时rect_self_hide = rect_self_show;
        rect_self_hide.size.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            tapV.alpha = 1.0f;
            self.alpha = 1.0f;
            
            //要设置成0，不设置非零值如0.2，是为了防止在显示出来的时候，在0.3秒内很快按两次按钮，仍有view存在
            tapV.alpha = 0.0f;
            self.alpha = 0.0f;
            
            [self setFrame:rect_self_hide];
            
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
            [tapV removeFromSuperview];
        }];
        
    }else{
        [self removeFromSuperview];
        [tapV removeFromSuperview];
    }
    
    
    if (self.popupInView_blockHideComplete) {
        self.popupInView_blockHideComplete();
    }
}



@end
