//
//  RadioControllers.h
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-12.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RadioControllersDelegate <NSObject>

/**
 *  在radioControllersView上改变选中的index
 *
 *  @param index
 */
- (void)radioControllersDidChangeToIndex:(NSInteger)index;

@end




@interface RadioControllers : UIView<UIScrollViewDelegate>{
    
    
    NSInteger currentShowViewIndex; /**< 当前显示的视图(即中视图)上的视图内容在所有view中的位置 */
    NSInteger selIndex;
    
    UIView *_viewL;
    UIView *_viewC;
    UIView *_viewR;
}


@property (assign,nonatomic) id<RadioControllersDelegate> delegate;
@property (strong,nonatomic) NSMutableArray *views;

/**
 *  设置滚动视图的UIViewController的View,必须设置3个以上的视图。
 *
 *  @param views
 */
- (void)setScrollViews:(NSMutableArray *)views;
- (void)setScrollViews:(NSMutableArray *)views andShowIndex:(NSInteger)showIndex;


/**
 *  显示第几个View（即将第viewIndex位置的View显示到centerView中）
 *
 *  @param showViewIndex 要显示的view的索引
 */
- (void)showViewWithIndex:(NSInteger)showViewIndex;

@end
