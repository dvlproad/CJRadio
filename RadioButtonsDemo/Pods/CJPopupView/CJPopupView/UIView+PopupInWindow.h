//
//  UIView+PopupInWindow.h
//  CJPopupViewDemo
//
//  Created by lichq on 6/22/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    PopupInWindowLocationBottom = 0,
    PopupInWindowLocationCenter
}PopupInWindowLocation;

typedef enum {
//    MJPopupViewAnimationFade = 0,
//    MJPopupViewAnimationSlideBottomTop = 1,
//    MJPopupViewAnimationSlideBottomBottom,
//    MJPopupViewAnimationSlideTopTop,
//    MJPopupViewAnimationSlideTopBottom,
//    MJPopupViewAnimationSlideLeftLeft,
//    MJPopupViewAnimationSlideLeftRight,
//    MJPopupViewAnimationSlideRightLeft,
//    MJPopupViewAnimationSlideRightRight,
    CJPopupViewAnimationNone = 0,   //Directly
    CJPopupViewAnimationNormal,
    CJPopupViewAnimationCATransform3D
    
} CJPopupViewAnimation;



@interface UIView (PopupInWindow){
    
}
//@property(nonatomic, strong) id customView;
//@property(nonatomic, strong) id<QPopViewDelegate> delegate;
//@property(nonatomic, assign) NSInteger locationType;
//@property(nonatomic, assign) BOOL canDismissAutomatic;//不允许点击其他区域退出，默认允许



- (void)popupInWindowLocationType:(PopupInWindowLocation)locationType animationType:(CJPopupViewAnimation)animationType;
- (void)dismissPopupViewInWindowWithAnimationType:(CJPopupViewAnimation)animationType;

@end
