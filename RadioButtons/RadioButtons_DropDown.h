//
//  RadioButtons_DropDown.h
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RadioButtons.h"

@interface RadioButtons_DropDown : RadioButtons{
    
}
@property (nonatomic, strong) UIView *m_SuperView;
@property (nonatomic, strong) UIView *tapV;
@property (nonatomic, strong) UIView *extendView;

- (void)showDropDownView:(UIView *)dropDownView inView:(UIView *)superView complete:(void(^)(void))block;
- (void)didSelectInDropDownView_rbDropDown:(NSString *)title;

@end
