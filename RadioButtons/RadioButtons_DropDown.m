//
//  RadioButtons_DropDown.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RadioButtons_DropDown.h"
#import <CJPopupView/CJPopupView.h>

@implementation RadioButtons_DropDown

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//注意：shouldUpdateRadioButtonSelected和shouldDidDelegate的返回值一定是相反的
- (BOOL)shouldUpdateRadioButtonSelected_WhenClickSameRadioButton{   //可根据情况为YES或NO
    return YES; //设默认可重复点击（YES:可重复点击  NO:不可重复点击）
}

- (BOOL)shouldDidDelegate_WhenClickSameRadioButton{
    return ![self shouldUpdateRadioButtonSelected_WhenClickSameRadioButton];
}



- (void)doSomethingExtra_WhenClickSameRadioButton:(RadioButton *)radioButton_same{//重写继承的方法
    [self hideDropDownView_popupDropDownView];
}

- (void)doSomethingExtra_WhenClickNewRadioButton:(RadioButton *)radioButton{
    //do nothing...
}

- (void)shouldMoveScrollViewToSelectItem:(RadioButton *)radioButton{
    //do nothing...
}




- (void)showDropDownView:(UIView *)dropDownView inView:(UIView *)superView complete:(void(^)(void))block{
    
    [self popupDropDownView:dropDownView inLowestSuperview:superView complete:block];
    
    __weak RadioButtons_DropDown *self_weak = self;
    [self setBlockTapBGComplete:^{
        //NSLog(@"111...block_TapBGComplete");
        RadioButton *radioButton = (RadioButton *)[self_weak viewWithTag:RadioButton_TAG_BEGIN + currentExtendSection];
        radioButton.selected = !radioButton.selected;

    } blockHideDropDownViewComplete:^{
        //NSLog(@"222...block_HideDropDownViewComplete");
        currentExtendSection = -1;  //设置成-1表示当前未选中任何radioButton
    }];
}


- (void)didSelectInDropDownView_rbDropDown:(NSString *)title{
    RadioButton *radioButton_cur = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + currentExtendSection];
    radioButton_cur.selected = !radioButton_cur.selected;
    [radioButton_cur setTitle:title];
    
    [self doSomethingExtra_WhenClickSameRadioButton:nil];
}



@end
