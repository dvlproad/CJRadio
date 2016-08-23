//
//  RadioButtons_Slider.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RadioButtons_Slider.h"

@interface RadioButtons_Slider() {
    UIButton *btnArrowL;
    UIButton *btnArrowR;
}
@property (nonatomic, assign) CGFloat arrowImageWidth;

@end



@implementation RadioButtons_Slider


- (BOOL)shouldUpdateRadioButtonSelected_WhenClickSameRadioButton{   //固定为NO
    return NO;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat totalWidth = CGRectGetWidth(self.frame);
    CGFloat totalHeight = CGRectGetHeight(self.frame);
    
    CGFloat leftArrowButtonHeight = totalHeight;
    CGFloat leftArrowButtonY = 0;
    CGFloat leftArrowButtonWidth = self.arrowImageWidth;
    CGFloat leftArrowButtonX = 0;
    [btnArrowL setFrame:CGRectMake(leftArrowButtonX,
                                   leftArrowButtonY,
                                   leftArrowButtonWidth,
                                   leftArrowButtonHeight)];
    
    
    CGFloat rightArrowButtonHeight = totalHeight;
    CGFloat rightArrowButtonY = 0;
    CGFloat rightArrowButtonWidth = self.arrowImageWidth;
    CGFloat rightArrowButtonX = totalWidth - rightArrowButtonWidth;
    [btnArrowR setFrame:CGRectMake(rightArrowButtonX,
                                   rightArrowButtonY,
                                   rightArrowButtonWidth,
                                   rightArrowButtonHeight)];
}

/** 完整的描述请参见文件头部 */
- (void)addLeftArrowImage:(UIImage *)leftArrowImage
          rightArrowImage:(UIImage *)rightArrowImage
      withArrowImageWidth:(CGFloat)arrowImageWidth {
    
    self.arrowImageWidth = arrowImageWidth;
    
    //创建左滑动箭头
    btnArrowL = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnArrowL setFrame:CGRectZero];
    [btnArrowL setBackgroundImage:leftArrowImage forState:UIControlStateNormal];
    [btnArrowL addTarget:self action:@selector(leftArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnArrowL];
    
    //创建右滑动箭头
    btnArrowR = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnArrowR setFrame:CGRectZero];
    [btnArrowR setBackgroundImage:rightArrowImage forState:UIControlStateNormal];
    [btnArrowR addTarget:self action:@selector(rightArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnArrowR];
    
    
    //刚开始隐藏左箭头，显示右箭头
    btnArrowL.hidden = YES;
    btnArrowR.hidden = NO;
}


#pragma mark - 箭头点击事件
- (void)leftArrowButtonAction:(UIButton *)sender {
    CGFloat contentOffsetX = self.sv.contentOffset.x;
    
    RadioButton *targetRadioButton = nil;
    for (NSInteger i = 0; i < countTitles; i++) { //从第一个开始找，找到的第一个即是所求
        RadioButton *radioButton = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + i];
        
        /* 确保”要找的按钮“的左侧至少在显示的“左侧箭头的最右侧值”之左 */
        if (CGRectGetMinX(radioButton.frame) >= contentOffsetX + CGRectGetMaxX(btnArrowL.frame)) {
            continue;
        }
        
        /* 同时确保”要找的按钮“的右侧要至少在显示的“左侧箭头的最右侧值”之右 */
        if (CGRectGetMaxX(radioButton.frame) < contentOffsetX + CGRectGetMaxX(btnArrowL.frame)) {
            continue;
        }
        
        targetRadioButton = radioButton;
        NSLog(@"left: targetRadioButtonText = %@", targetRadioButton.lab.text);
        break;
    }
    
    /* 移动操作 */
    CGFloat newContentOffsetX;
    BOOL isFirstRadioButton = (targetRadioButton.index == 0) ? YES : NO;
    if (!isFirstRadioButton) {
        newContentOffsetX = CGRectGetMinX(targetRadioButton.frame) - CGRectGetWidth(btnArrowL.frame); //注意这里是减
    } else {
        newContentOffsetX = CGRectGetMinX(targetRadioButton.frame);
    }
    
    [self.sv setContentOffset:CGPointMake(newContentOffsetX, self.sv.contentOffset.y) animated:YES];
}

- (void)rightArrowButtonAction:(UIButton *)sender {
    CGFloat contentOffsetX = self.sv.contentOffset.x;
    
    RadioButton *targetRadioButton = nil;
    for (NSInteger i = 0; i < countTitles; i++) {   //从最后一个开始找，找到的第一个即是所求
        RadioButton *radioButton = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + i];
        
        /* 确保”要找的按钮“的左侧至少在显示的屏幕的最左侧之右 */
        if (CGRectGetMinX(radioButton.frame) - contentOffsetX < 0) {
            continue;
        }
        
        /* 同时确保”要找的按钮“的右侧要至少在显示的“右侧箭头的最左侧值”之右 */
        //尤其注意：这里的btnArrowR不是添加在scrollView上的，所以不要忘了要加上contentOffsetX来比较
        if (CGRectGetMaxX(radioButton.frame) <= contentOffsetX + CGRectGetMinX(btnArrowR.frame)) {
            continue;
        }
        targetRadioButton = radioButton;
        NSLog(@"right: targetRadioButtonText = %@", targetRadioButton.lab.text);
        
        break;
    }
    
    /* 移动操作 */
    CGFloat rightAddMoveOffset;
    BOOL isLastRadioButton = (targetRadioButton.index == countTitles - 1) ? YES : NO;
    if (!isLastRadioButton) {
        rightAddMoveOffset = CGRectGetMaxX(targetRadioButton.frame) - (contentOffsetX + CGRectGetMinX(btnArrowR.frame));
    } else {
        rightAddMoveOffset = CGRectGetMaxX(targetRadioButton.frame) - (contentOffsetX + CGRectGetWidth(self.sv.frame));
    }
    CGFloat newContentOffsetX = self.sv.contentOffset.x + rightAddMoveOffset;
    [self.sv setContentOffset:CGPointMake(newContentOffsetX, self.sv.contentOffset.y) animated:YES];
}


- (void)selectRadioButtonIndex:(NSInteger)index{
    RadioButton *radioButton_old = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + self.index_cur];
    radioButton_old.selected = NO;
    
    RadioButton *radioButton_cur = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + index];
    radioButton_cur.selected = YES;
    [self shouldMoveScrollViewToSelectItem:radioButton_cur];
    
    self.index_cur = index;
}

- (void)shouldMoveScrollViewToSelectItem:(RadioButton *)targetRadioButton {//滑动scrollView到显示出完整的targetRadioButton
    
#pragma mark 移动方法
    //该item的距离计算。
    //CGFloat leftX = CGRectGetMinX(targetRadioButton.frame);
    CGFloat rightX = CGRectGetMaxX(targetRadioButton.frame);
    
    if (rightX >= self.frame.size.width - 60) { //如果rightX离self.frame边缘太近(小于40)就要移动,设移动距离为moveOffset
        CGFloat moveOffset = self.frame.size.width/2 + 40;
        CGFloat rightX_new;
        
        if (rightX + moveOffset >= self.sv.contentSize.width) {//如果向左移动moveOffset后，会超出边界，则移动到末尾
            moveOffset = self.frame.size.width;
            rightX_new = self.sv.contentSize.width - moveOffset;
            
            [self.sv setContentOffset:CGPointMake(rightX_new, self.sv.contentOffset.y) animated:YES];
        }else{
            
            rightX_new = rightX - moveOffset;
            
            if (rightX_new > 0) {
                [self.sv setContentOffset:CGPointMake(rightX_new, self.sv.contentOffset.y) animated:YES];
            }
        }
        
    }else{
        [self.sv setContentOffset:CGPointMake(0, self.sv.contentOffset.y) animated:YES];
    }
}


#pragma mark - UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        btnArrowL.hidden = YES;
        btnArrowR.hidden = NO;
    }else if (scrollView.contentOffset.x+scrollView.frame.size.width == scrollView.contentSize.width) {
        btnArrowL.hidden = NO;
        btnArrowR.hidden = YES;
    }else {
        btnArrowL.hidden = NO;
        btnArrowR.hidden = NO;
    }
}


@end
