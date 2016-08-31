//
//  CJButtonControllerView.h
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtons.h"
#import "RadioComposeView.h"

@interface CJButtonControllerView : UIView {
    
}
//设置RadioButtons需要的数据
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) BOOL showLineImageView;   /**< 是否显示底部线 */
@property (nonatomic, strong) UIImage *lineImage;       /**< 底部线的图片 */
@property (nonatomic, assign) CGFloat lineImageViewHeight;  /**< 底部线的图片的高度（默认1） */


//设置RadioComposeView需要的数据
@property (nonatomic, strong) NSArray<UIViewController *> *componentViewControllers;
@property (nonatomic, strong) UIViewController *componentViewParentViewController;

//设置Self其他设置需要的数据
@property (nonatomic, assign) NSInteger defaultSelectedIndex;           /**< 默认选择第几个0 */
@property (nonatomic, assign) NSInteger maxRadioButtonsShowViewCount;   /**< 最大展示个数，默认3 */


- (void)reloadData;   //TODO: 用于类似栏目变更操作

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

@end
