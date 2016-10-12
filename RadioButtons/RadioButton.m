//
//  RadioButton.m
//  RadioButtonsDemo
//
//  Created by lichq on 9/9/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "RadioButton.h"

@implementation RadioButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib {
    [self.button addTarget:self action:@selector(radioButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)commonInit {
    self.label = [[UILabel alloc] init];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    [self cj_makeView:self addSubView:self.label withEdgeInsets:UIEdgeInsetsZero];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(radioButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self cj_makeView:self addSubView:self.button withEdgeInsets:UIEdgeInsetsZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.textColor = self.isSelected ? self.textSelectedColor : self.textNormalColor;
}

- (void)setTitle:(NSString *)title {
    //[self.button  setTitle:title forState:UIControlStateNormal];
    [self.label setText:title];
}

- (void)setSelected:(BOOL)selected {
    if (selected == _selected) {    //如果选中的一样则不进行操作，比如imageV就不进行transform了
        return;
    }
    
    _selected = selected;
    self.button.selected = selected;
    self.label.textColor = selected ? self.textSelectedColor : self.textNormalColor;
    
    
    if (self.stateChangeCompleteBlock) {
        self.stateChangeCompleteBlock(self);
    }
}

- (void)radioButtonClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(radioButtonClick:)]) {
        [self.delegate radioButtonClick:self];
    }
}

#pragma mark - addSubView
- (void)cj_makeView:(UIView *)superView addSubView:(UIView *)subView withEdgeInsets:(UIEdgeInsets)edgeInsets {
//- (void)cj_addSubView:(UIView *)subView toSuperView:(UIView *)superView withEdgeInsets:(UIEdgeInsets)edgeInsets {
    [superView addSubview:subView];
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    //left
    [superView addConstraint:
     [NSLayoutConstraint constraintWithItem:subView
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                   constant:edgeInsets.left]];
    //right
    [superView addConstraint:
     [NSLayoutConstraint constraintWithItem:subView
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1
                                   constant:edgeInsets.right]];
    //top
    [superView addConstraint:
     [NSLayoutConstraint constraintWithItem:subView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1
                                   constant:edgeInsets.top]];
    //bottom
    [superView addConstraint:
     [NSLayoutConstraint constraintWithItem:subView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1
                                   constant:edgeInsets.bottom]];
}


@end
