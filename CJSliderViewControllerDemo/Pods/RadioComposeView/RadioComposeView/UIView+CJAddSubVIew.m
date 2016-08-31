//
//  UIView+CJAddSubVIew.m
//  CJSliderViewControllerDemo
//
//  Created by 李超前 on 16/8/20.
//  Copyright © 2016年 李超前. All rights reserved.
//

#import "UIView+CJAddSubVIew.h"

@implementation UIView (CJAddSubVIew)

- (void)cj_addSubView:(UIView *)subView withEdgeInsets:(UIEdgeInsets)edgeInsets {
    [self addSubview:subView];
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    //left
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:edgeInsets.left]];
    //right
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:edgeInsets.right]];
    //top
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:edgeInsets.top]];
    //bottom
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:edgeInsets.bottom]];
}

@end
