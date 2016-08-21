//
//  RadioButtons.m
//  RadioButtonsDemo
//
//  Created by lichq on 7/8/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "RadioButtons.h"

#define kMaxShowCount 5

@implementation RadioButtons
@synthesize sv;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initizalScrollView];
    }
    return self;
}

- (void)awakeFromNib{
    [self initizalScrollView];
}

- (void)initizalScrollView{
#pragma mark - 当scrollView位于第一个子视图时，其会对内容自动调整。如果你不想让scrollView的内容自动调整，可采取如下两种方法中的任一一种(这里采用第一种)。方法一：取消添加lab，以使得scrollView不是第一个子视图，从而达到取消scrollView的自动调整效果方法二：automaticallyAdjustsScrollViewInsets：如果你不想让scrollView的内容自动调整，将这个属性设为NO（默认值YES）。详细情况可参考evernote笔记中的UIStatusBar笔记内容
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
    [self addSubview:lab];
    
    [self addScrollViewForTab];
}

- (void)addScrollViewForTab{
    sv = [[UIScrollView alloc]initWithFrame:CGRectZero];
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
    sv.delegate = self;
    sv.bounces = NO;
    sv.backgroundColor = [UIColor orangeColor];
    
    [self addSubview:sv];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat totalHeight = CGRectGetHeight(self.frame);
    CGFloat totalWidth = CGRectGetWidth(self.frame);
    CGFloat sectionWidth = totalWidth/kMaxShowCount;
    
    [sv setFrame:CGRectMake(0, 0, totalWidth, totalHeight)];
    [sv setContentSize:CGSizeMake(sectionWidth * radioButtons.count, totalHeight)]; //设置sv.contentSize
    
    for (NSInteger i = 0; i < radioButtons.count; i++) {
        RadioButton *radioButton = [radioButtons objectAtIndex:i];
        
        CGRect rect_radioButton = CGRectMake(sectionWidth*i, 0, sectionWidth, self.frame.size.height);
        [radioButton setFrame:rect_radioButton];
    }
    
    for (NSInteger i = 0; i < lineViews.count; i++) {
        UIView *lineView = [lineViews objectAtIndex:i];
        CGRect rect_line = CGRectMake(sectionWidth*(i+1), 5, 1, self.frame.size.height - 10);
        [lineView setFrame:rect_line];
    }
}

- (void)setTitles:(NSArray *)titles radioButtonNidName:(NSString *)nibName{
    [self setTitles:titles radioButtonNidName:nibName andShowIndex:-1];
}

- (void)setTitles:(NSArray *)titles radioButtonNidName:(NSString *)nibName andShowIndex:(NSInteger)showIndex{
    NSAssert(titles.count >= 3, @"the min count of the titles is 3");
    NSAssert(nibName != nil, @"radioButton的nibName未设置，请检查");
    
    NSInteger sectionNum = [titles count];
    if (sectionNum == 0) {
        NSLog(@"error: [titles count] == 0");
    }
    countTitles = sectionNum;
    
    self.index_cur = showIndex; //如果self.index_cur = -1，则代表未有任何radioButton选中
    
    //添加radioButton到sv中
    radioButtons = [[NSMutableArray alloc] init];
    lineViews = [[NSMutableArray alloc] init];
    for (int i = 0; i <sectionNum; i++) {
        NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil];
        RadioButton *radioButton = [radioButtonNib lastObject];
        
        [radioButton setTitle:titles[i]];
        radioButton.delegate = self;
        radioButton.tag = RadioButton_TAG_BEGIN + i;
        if (i == showIndex) {
            [radioButton setSelected:YES];
            [self shouldMoveScrollViewToSelectItem:radioButton];//改名addAnimation
        }else{
            [radioButton setSelected:NO];
        }
        [self.sv addSubview:radioButton];
        [radioButtons addObject:radioButton];
        
        if (i < sectionNum && i != 0) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
            lineView.backgroundColor = [UIColor lightGrayColor];
            [self.sv addSubview:lineView];
            [lineViews addObject:lineView];
        }
    }
}

//注意radioButton_cur经常有未选中的状态，即经常会有self.index_cur == -1的情况
- (void)radioButtonClick:(RadioButton *)radioButton_cur{
    
    NSInteger index_old = self.index_cur;
    self.index_cur = radioButton_cur.tag - RadioButton_TAG_BEGIN;
    
    BOOL isSameIndex = self.index_cur == index_old ? YES : NO;
    //NSLog(@"index_cur = %zd, index_old = %zd, isSameIndex= %@", self.index_cur,index_old,isSameIndex?@"YES":@"NO");
    
    if (index_old == -1) {//如果当前没有radioButton是被选中。
        
    }else{  //index_old != -1，即表示如果当前有radioButton是被选中。
        if (index_old == self.index_cur) {
            isSameIndex = YES;
            
        }else{
            //如果有选中,且点击不同index的话，则还需要把之前的那个按钮的状态也改变掉。
            RadioButton *radioButton_old = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + index_old];
            radioButton_old.selected = !radioButton_old.selected;
        }
    }
    
    
    BOOL shouldUpdateCurrentRadioButtonSelected = [self shouldUpdateRadioButtonSelected_WhenClickSameRadioButton];//设默认不可重复点击（YES:可重复点击  NO:不可重复点击）
    if (isSameIndex) {
        if (shouldUpdateCurrentRadioButtonSelected) {
            radioButton_cur.selected = !radioButton_cur.selected;
        }
        
    }else{
        radioButton_cur.selected = !radioButton_cur.selected;
    }
    
    if([self.delegate respondsToSelector:@selector(radioButtons:chooseIndex:oldIndex:)]){
        [self.delegate radioButtons:self chooseIndex:self.index_cur oldIndex:index_old];
        
        if (isSameIndex && shouldUpdateCurrentRadioButtonSelected) { //此条if语句位置待确定
            [self setSelectedNone];
        }
    }
}



- (BOOL)shouldUpdateRadioButtonSelected_WhenClickSameRadioButton{
    switch (self.radioButtonType) {
        case RadioButtonTypeNormal:{
            return NO;
            break;
        }
        case RadioButtonTypeCanDrop:{
            return YES;
            break;
        }
        case RadioButtonTypeCanSlider:{
            
            break;
        }
        default:{
            return NO;
            break;
        }
    }
    return NO;  //设默认不可重复点击（YES:可重复点击  NO:不可重复点击）
}


- (void)shouldMoveScrollViewToSelectItem:(RadioButton *)radioButton{
    
}


//add
- (void)radioButtons_didSelectInExtendView:(NSString *)title {
    RadioButton *radioButton_cur = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + self.index_cur];
    radioButton_cur.selected = !radioButton_cur.selected;
    [radioButton_cur setTitle:title];
    
    [self cj_hideDropDownExtendView];
    [self setIndex_cur:-1];
}


- (void)changeCurrentRadioButtonStateAndTitle:(NSString *)title{
    RadioButton *radioButton_cur = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + self.index_cur];
    radioButton_cur.selected = !radioButton_cur.selected;
    [radioButton_cur setTitle:title];
}

- (void)changeCurrentRadioButtonState{
    RadioButton *radioButton_cur = (RadioButton *)[self viewWithTag:RadioButton_TAG_BEGIN + self.index_cur];
    radioButton_cur.selected = !radioButton_cur.selected;
}

- (void)setSelectedNone{
    self.index_cur = -1;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
