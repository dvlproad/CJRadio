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
@protocol RadioButtonsDelegate <NSObject>
@required
- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old;

@end



//由于点击RadioButton的时候，还要涉及到其他RadioButton中图标的变化，所以RadioButtons不适合再分开。
@interface RadioButtons : UIView <RadioButtonDelegate, UIScrollViewDelegate> {
    NSInteger countTitles;
    
    NSMutableArray *radioButtons;
    NSMutableArray *lineViews;
}
@property (nonatomic, strong) UIScrollView *sv;//当要显示的radiobutton太多时有用（可通过滑动查看）
@property (nonatomic, strong) id <RadioButtonsDelegate>delegate;
@property (nonatomic, assign) NSInteger index_cur;//当前展开的index ，默认－1时，表示都没有展开
@property (nonatomic, assign) RadioButtonType radioButtonType;
@property (nonatomic, assign) NSInteger maxShowViewCount;       /**< 设置最大的显示数(默认3) */
@property (nonatomic, assign) NSInteger defaultSelectedIndex;   /**< 设置初始默认显示第几个(默认-1,即无任何选择) */

@property (nonatomic, assign) BOOL shouldMoveScrollViewToSelectItem;


- (void)setTitles:(NSArray *)titles radioButtonNidName:(NSString *)nibName;
//以上为通用的


- (void)changeCurrentRadioButtonStateAndTitle:(NSString *)title;
- (void)changeCurrentRadioButtonState;
- (void)setSelectedNone; //设置为未选择任何radioButton


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
