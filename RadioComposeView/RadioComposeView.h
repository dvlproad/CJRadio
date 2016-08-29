//
//  RadioComposeView.h
//  RadioComposeViewDemo
//
//  Created by lichq on 14-11-12.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RadioComposeViewDelegate <NSObject>

/**
 *  radioComposeView上选中的index改变时触发
 *
 *  @param index
 */
- (void)cj_radioComposeViewDidChangeToIndex:(NSInteger)index;

@end



/**
 *  单选View的组合类
 */
@interface RadioComposeView : UIView <UIScrollViewDelegate> {
    NSInteger currentShowViewIndex; /**< 当前显示的视图(即中视图)上的视图内容在所有view中的位置 */
    NSInteger selIndex;
    
    UIView *_viewL;
    UIView *_viewC;
    UIView *_viewR;
}


@property (assign, nonatomic) id<RadioComposeViewDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *views;

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
