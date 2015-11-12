//
//  UIView+PopupInWindow.m
//  CJPopupViewDemo
//
//  Created by lichq on 6/22/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "UIView+PopupInWindow.h"
#define kPopupViewAnimationDuration 0.3f
#define kCJPopupViewTag     23942
#define kCJOverlayViewTag   23945


@implementation UIView (PopupInWindow)


//- (BOOL)canDismissAutomatic{
//    return objc_getAssociatedObject(self, @"canDismissAutomatic");
//}
//
//- (void)setCanDismissAutomatic:(BOOL)canDismissAutomatic{
//    
//}




#pragma mark - 显示/隐藏


- (void)popupInWindowLocationType:(PopupInWindowLocation)locationType animationType:(CJPopupViewAnimation)animationType
{
//    self.locationType = locationType;
    
    //首先明确self是弹出来看到的那个区域。只不过它是keywindow中一部分而已。获取keyWindow,整个区域添加overlay（且overlay的整个部分添加dismissControl来让用户点击非self部分时候dismiss），添加完后再在keyWindow的下面区域添加self覆盖在overlay上（用于显示self）。
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    //NSLog(@"%@", keywindow);
    if (![keywindow.subviews containsObject:self]) {
        
        // Add overlay
        UIView *overlay = [[UIView alloc]initWithFrame:keywindow.bounds];
        overlay.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.6];
        overlay.tag = kCJOverlayViewTag;
        [keywindow addSubview:overlay];
        
        //overlay's ss
        UIView* tmpView = [[UIView alloc]initWithFrame:keywindow.bounds];
        [overlay addSubview:tmpView];
        
        //overlay's dismissControl
//        if (self.canDismissAutomatic) {
            CGRect dismissControlFrame = CGRectMake(0, 0, keywindow.frame.size.width, keywindow.frame.size.height);
            UIControl * dismissControl = [[UIControl alloc] initWithFrame:dismissControlFrame];
            [dismissControl addTarget:self action:@selector(dismissControlAction) forControlEvents:UIControlEventTouchUpInside];
            dismissControl.backgroundColor = [UIColor clearColor];
            [overlay addSubview:dismissControl];
//        }
        
        
        //overlay's myView
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.8;
        self.tag = kCJPopupViewTag;
        [keywindow addSubview:self];
        
        
        if (locationType == PopupInWindowLocationBottom) {
//        if (locationType == CJPopupViewLocationBottom && animationType == CJPopupViewAnimationNormal) {
            self.frame = CGRectMake(0, keywindow.frame.size.height, keywindow.frame.size.width, self.frame.size.height);
            [UIView animateWithDuration:kPopupViewAnimationDuration animations:^{
                self.frame = CGRectMake(0, keywindow.frame.size.height-self.frame.size.height, keywindow.frame.size.width, self.frame.size.height);
            }];
            
//        }else if (locationType == CJPopupViewLocationCenter && animationType == CJPopupViewAnimationCATransform3D){
        }else if (locationType == PopupInWindowLocationCenter){
            self.center = keywindow.center;
            /* 动画
             self.alpha = 0;
             
             CGContextRef context = UIGraphicsGetCurrentContext();
             [UIView beginAnimations:@"Dialog" context:context];
             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
             [UIView setAnimationDuration:0.0];
             
             self.alpha = 1;
             
             [UIView commitAnimations];
             */

            CATransform3D rotate = CATransform3DMakeRotation(70.0 * M_PI / 180.0, 0.0, 0.0, 1.0);
            CATransform3D translate = CATransform3DMakeTranslation(20.0, -500.0, 0.0);
            self.layer.transform = CATransform3DConcat(rotate, translate);
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.layer.transform = CATransform3DIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

- (void)dismissControlAction{
    [self dismissPopupViewInWindowWithAnimationType:CJPopupViewAnimationNormal];
}

- (void)dismissPopupViewInWindowWithAnimationType:(CJPopupViewAnimation)animationType
{
    UIWindow * keywindow = [[UIApplication sharedApplication] keyWindow];
    if (keywindow.subviews.count < 2) {
        return;
    }

//    UIView *popupView = [keywindow.subviews objectAtIndex:keywindow.subviews.count-1];
//    UIView *overlay = [keywindow.subviews objectAtIndex:keywindow.subviews.count-2];
    UIView *popupView = [keywindow viewWithTag:kCJPopupViewTag];
    UIView *overlay = [keywindow viewWithTag:kCJOverlayViewTag];
    
    [UIView animateWithDuration:kPopupViewAnimationDuration delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        switch (animationType) {
            case CJPopupViewAnimationNone:
            {
                break;
            }
            case CJPopupViewAnimationNormal:
            {
                popupView.frame = CGRectMake(0, keywindow.frame.size.height, popupView.frame.size.width, popupView.frame.size.height);
                break;
            }
            case CJPopupViewAnimationCATransform3D:
            {
                CATransform3D rotate = CATransform3DMakeRotation(-70.0 * M_PI / 180.0, 0.0, 0.0, 1.0);
                CATransform3D translate = CATransform3DMakeTranslation(-20.0, 500.0, 0.0);
                self.layer.transform = CATransform3DConcat(rotate, translate);
                break;
            }
            default:
                break;
        }
        
        
    } completion:^(BOOL finished) {
        [overlay removeFromSuperview];
        [popupView removeFromSuperview];
    }];
    
}


@end
