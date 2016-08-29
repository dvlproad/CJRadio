//
//  RadioButtons.h
//  RadioButtonsDemo
//
//  Created by lichq on 7/8/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RadioButton.h"

#import "UIView+CJShowDropView.h"
#import "UIView+CJAddSubVIew.h"

#define RadioButton_TAG_BEGIN   1000

typedef NS_ENUM(NSUInteger, RadioButtonType) {
    RadioButtonTypeNormal = 0,
    RadioButtonTypeCanDrop,
    RadioButtonTypeCanSlider    //RadioButtonTypeCanSlider 等价于RadioButtonTypeNormal
};

@class RadioButtons;

@protocol RadioButtonsDataSource <NSObject>
@required
- (NSInteger)cj_numberOfComponentsInRadioButtons:(RadioButtons *)radioButtons;

- (RadioButton *)cj_radioButtons:(RadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index;

@optional
/**
 *  设置初始默认选中第几个(默认-1,即无任何选择)
 *
 *  @param radioButtons radioButtons
 *
 *  @return 默认显示的view的index
 */
- (NSInteger)cj_defaultShowIndexInRadioButtons:(RadioButtons *)radioButtons; // Default is -1 if not implemented

- (CGFloat)cj_radioButtons:(RadioButtons *)radioButtons widthForComponentAtIndex:(NSInteger)index;

@end



@protocol RadioButtonsDelegate <NSObject>
@required
- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old;

@end






//由于点击RadioButton的时候，还要涉及到其他RadioButton中图标的变化，所以RadioButtons不适合再分开。
@interface RadioButtons : UIView <RadioButtonDelegate, UIScrollViewDelegate> {
    
}
@property (nonatomic, weak) id <RadioButtonsDataSource> dataSource;
@property (nonatomic, weak) id <RadioButtonsDelegate> delegate;
@property (nonatomic, assign) RadioButtonType radioButtonType;
@property (nonatomic, assign) NSInteger maxShowViewCount;       /**< 设置最大的显示数(默认3) */
@property (nonatomic, assign) BOOL shouldMoveScrollViewToSelectItem;/**< 选中的时候是否滚动到该按钮 */
@property (nonatomic, assign) NSInteger currentSelectedIndex;   /**< 当前选中的按钮的index值（当该值为默认的－1时，表示都没有选中） */


///**
// *  设置单选按钮组合的标题数组，以及单选按钮单元是用什么单选按钮组合起来的
// *
// *  @param titles  单选按钮组合的标题数组
// *  @param nibName 创建单选按钮单元的xib文件
// */
//- (void)setTitles:(NSArray *)titles radioButtonNidName:(NSString *)nibName;
- (void)reloadViews;


- (void)changeCurrentRadioButtonStateAndTitle:(NSString *)title;
- (void)changeCurrentRadioButtonState;

/**
 *  设置为未选择任何radioButton
 */
- (void)setSelectedNone;


//RadioButtonsCanDrop使用到的
- (void)radioButtons_didSelectInExtendView:(NSString *)title;


#pragma mark - 有左右箭头的时候
/**
 *  为view添加左侧箭头视图和右侧箭头视图
 *
 *  @param leftArrowImage  左侧箭头视图
 *  @param rightArrowImage 右侧箭头视图
 *  @param arrowImageWidth 两个箭头视图共同的宽度
 */
- (void)addLeftArrowImage:(UIImage *)leftArrowImage
          rightArrowImage:(UIImage *)rightArrowImage
      withArrowImageWidth:(CGFloat)arrowImageWidth;

/**
 *  选中第index个单选按钮
 *
 *  @param index 要选择的单选按钮的索引值
 */
- (void)selectRadioButtonIndex:(NSInteger)index;

@end
