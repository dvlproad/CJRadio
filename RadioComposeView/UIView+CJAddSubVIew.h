//
//  UIView+CJAddSubVIew.h
//  CJSliderViewControllerDemo
//
//  Created by 李超前 on 16/8/20.
//  Copyright © 2016年 李超前. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CJAddSubVIew)

/**
 *  为当前view添加子视图，且子视图与父视图的约束关系为边缘各间距为edgeInsets
 *
 *  @param subView    要添加的子视图
 *  @param edgeInsets 子视图与父视图的边缘间距
 */
- (void)cj_addSubView:(UIView *)subView withEdgeInsets:(UIEdgeInsets)edgeInsets;

@end
