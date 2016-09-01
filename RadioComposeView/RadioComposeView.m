//
//  RadioComposeView.m
//  RadioComposeViewDemo
//
//  Created by lichq on 14-11-12.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "RadioComposeView.h"
#import "UIScrollView+CJAddContentView.h"
#import "UIView+CJAddSubVIew.h"

@interface RadioComposeView () <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    UIView *contentView;
    
    UIView *_viewL;
    UIView *_viewC;
    UIView *_viewR;
    
    NSInteger currentShowViewIndex; /**< 当前显示的视图(即中视图)上的视图内容在所有view中的位置 */
    NSInteger selIndex;
}
@property (nonatomic, strong) NSArray *views;

@end

@implementation RadioComposeView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self scrollToCenterViewWithAnimate:NO];  //滑动到显示的视图(即中视图)
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self commonInit];
}

- (void)commonInit {
    self.backgroundColor = [UIColor blackColor];
    self.clipsToBounds = YES;
    
    [self addScrollViewToSelf];
    [self addContentViewToScrollView];
    
    //Left、Center、Right按RGB红绿蓝排序
    [self addLeftViewToScrollView];
    [self addCenterViewToScrollView];
    [self addRightViewToScrollView];
}

- (void)setDataSource:(id<RadioComposeViewDataSource>)dataSource {
    _dataSource = dataSource;
    
    //loadViews
    [self reloadViews];
}

/** 完整的描述请参见文件头部 */
- (void)reloadViews {
    //self.views
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(cj_radioViewsInRadioComposeView:)]) {
        self.views = [self.dataSource cj_radioViewsInRadioComposeView:self];
    }
    if (self.views.count < 3) {
        NSLog(@"warning: self.views.count < 3, wouldn't be reloadVies");
        return;
    }
    
    currentShowViewIndex = -1;
    
    //defaultShowIndex
    NSInteger defaultShowIndex = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(cj_defaultShowIndexInRadioComposeView:)]) {
        defaultShowIndex = [self.dataSource cj_defaultShowIndexInRadioComposeView:self];
    }
    
    [self resetViewToLeftCenterRightWithShowViewIndex:defaultShowIndex];
}

/**
 *  为 左·中·右视图 重新附上新的视图，且页面上显示的中视图的的视图在所有视图中所在的位置为index
 *
 *  @param showViewIndex 中视图的的视图在所有视图中的位置index
 */
- (void)resetViewToLeftCenterRightWithShowViewIndex:(NSInteger)centerViewIndex {
    if (currentShowViewIndex == centerViewIndex) {
        NSLog(@"resetViewToLeftCenterRight failure");
        return;
    }
    currentShowViewIndex = centerViewIndex;
    
    
    /* 取得 左·中·右视图，分别是所有view中的哪几个 */
    NSInteger indexForLeftView = (centerViewIndex == 0) ? self.views.count-1 : centerViewIndex-1;
    NSInteger indexForCenterView = centerViewIndex;
    NSInteger indexForRightView = (centerViewIndex == self.views.count-1) ? 0 : centerViewIndex+1;
    
    /* 为 左·中·右视图 重新附上新的视图：先remove，在add，这样就不会导致重复add多余的视图了 */
    //    for (NSInteger i = 0; i < self.views.count; i++) {
    //        if (i != indexL && i != indexC && i != indexR) {
    //            UIView *view = self.views[i];
    //            [view removeFromSuperview];
    //        }
    //    }
    for (UIView *view in _viewL.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in _viewC.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in _viewR.subviews) {
        [view removeFromSuperview];
    }
    
    
    //注：从保持的self.views中，拿出的 左·中·右视图 都已经把该view下的所有样式都完整的包含进去了，所以取出来的也是放好的
    UIView *newLeftView = [self.views objectAtIndex:indexForLeftView];
    UIView *newCenterView = [self.views objectAtIndex:indexForCenterView];
    UIView *newRightView = [self.views objectAtIndex:indexForRightView];
    
    [_viewL cj_addSubView:newLeftView withEdgeInsets:UIEdgeInsetsZero];//添加新view,要像这样有约束
    [_viewC cj_addSubView:newCenterView withEdgeInsets:UIEdgeInsetsZero];
    [_viewR cj_addSubView:newRightView withEdgeInsets:UIEdgeInsetsZero];
    
    //滑动到显示的视图(即中视图)
    //[self scrollToCenterView];  //原本使用frame的时候写在这里有效，现在由于使用约束，而导致第一次初始化的时候无效，所以讲第一次以及其他次分开成写在layoutSubviews和scrollViewDidEndDecelerating了。
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cj_radioComposeView:didChangeToIndex:)]) {
        [self.delegate cj_radioComposeView:self didChangeToIndex:centerViewIndex];
    }
}



#pragma mark - ScrolView、ContentView、LeftView、CenterView、RightView的加载
- (void)addScrollViewToSelf {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    _scrollView.backgroundColor = [UIColor cyanColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    [self cj_addSubView:_scrollView withEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}


- (void)addContentViewToScrollView {
    [_scrollView addSubview:contentView];
    
    //scrollView采用三页显示（只将前一页，现在页，下一页的页面加载进来，其他的不加载)，以此来节省内存开销。
    contentView = [_scrollView cj_addContentViewWithWidthMultiplier:3 heightMultiplier:1];
}

- (void)addLeftViewToScrollView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [contentView addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    /* width、height、top是不变的所以这里可以先写 */
    //width
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1
                                                            constant:0]];
    //height
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:1
                                                            constant:0]];
    //top
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0]];
    /* 计算left要多少 */
    //left
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:0]];
    
    //
    _viewL = view;
}

- (void)addCenterViewToScrollView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [contentView addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    /* width、height、top是不变的所以这里可以先写 */
    //width
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1
                                                            constant:0]];
    //height
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:1
                                                            constant:0]];
    //top
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0]];
    /* 计算left要多少 */
    //left
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_viewL
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1
                                                            constant:0]];
    
    //
    _viewC = view;
}


- (void)addRightViewToScrollView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [contentView addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    /* width、height、top是不变的所以这里可以先写 */
    //width
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1
                                                            constant:0]];
    //height
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_scrollView
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:1
                                                            constant:0]];
    //top
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0]];
    /* 计算left要多少 */
    //left
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_viewC
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1
                                                            constant:0]];
    
    //
    _viewR = view;
}



#pragma mark - 手动选择显示哪个viewController.view
/** 完整的描述请参见文件头部 */
- (void)showViewWithIndex:(NSInteger)showViewIndex {
    if (currentShowViewIndex == showViewIndex) {
        return;
    }
    
    NSInteger oldShowViewIndex = currentShowViewIndex;
    selIndex = showViewIndex;
    
    
    //方法①：选择后无滑动动画（因为我们这边要让选择后无滑动动画，所以不使用方法①)
    /*
    [self resetViewToLeftCenterRightWithShowViewIndex:showViewIndex];
    [self scrollToCenterViewWithAnimate:NO];
    return;
    */
    
    
    //方法②：选择后有滑动动画
    /* 判断要显示的新视图位于当前视图的左边还是右边 */
    BOOL isShowViewIndexLeftThanCurrent = selIndex < oldShowViewIndex || (oldShowViewIndex==0 && selIndex == self.views.count-1);   //目标视图位于左侧的情况
    BOOL isShowViewIndexRightThanCurrent = selIndex > oldShowViewIndex || (oldShowViewIndex==self.views.count-1 && selIndex==0);    //目标视图位于右侧的情况
    
    CGFloat x = CGRectGetMinX(_viewC.frame);
    CGFloat width = CGRectGetWidth(_scrollView.frame);
    CGFloat height = CGRectGetHeight(_scrollView.frame);
    
    if (isShowViewIndexLeftThanCurrent) {
        for (UIView *view in _viewL.subviews) {
            [view removeFromSuperview];
        }
        
        UIView *newLeftView = [self.views objectAtIndex:showViewIndex];
        [_viewL cj_addSubView:newLeftView withEdgeInsets:UIEdgeInsetsZero];
        
        x = x - width;
    } else if (isShowViewIndexRightThanCurrent) {
        for (UIView *view in _viewR.subviews) {
            [view removeFromSuperview];
        }
        
        UIView *newRightView = [self.views objectAtIndex:showViewIndex];
        [_viewR cj_addSubView:newRightView withEdgeInsets:UIEdgeInsetsZero];
        
        x = x + width;
    }
    
    
    [_scrollView scrollRectToVisible:CGRectMake(x, 0, width, height) animated:YES];//注：这里不能马上执行resetViewToLeftCenterRightWithShowViewIndex:因为滚动还没结束。所以应该将resetViewToLeftCenterRightWithShowViewIndex:放在滚动动画结束时候会调用的scrollViewDidEndScrollingAnimation方法里执行resetViewToLeftCenterRightWithShowViewIndex:。
}


#pragma mark - UIScrollViewDelegate
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //由于我们这里使用的是只加载当前页及当前页的前后两页来显示的方式，以减少内存方式，所以当我们拖动到不是所加载的这几页时，比如拖动到当前页的前两页时，就会由于之前没有加载，而显示空内容(即尤其是当我们拖动的距离超过一页的时候)。但是由于我们这里scrollView只设置了三页，也就是说scrollView的contentSize只有三页大小，意味着当scrollView处于中视图时候(实际上显示的时候一直是处于中视图的)，其根本不可能滑动操作一页。所以，我们这里也就没必要在拖动过程中随时检查是否超过一页，来为了避免出现拖动过程中出现空内容的view的情况。
    NSLog(@"scrollView.contentOffset.x  = %.1f", scrollView.contentOffset.x );
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging: %@", decelerate ? @"YES" : @"NO");
    NSLog(@"因为这里scrollView.pagingEnabled = YES;所以，我们视图的拖动结束和滚动结束都统一到scrollViewDidEndDecelerating中去处理。");
}
*/

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    //NSLog(@"执行有滚动动画的代码操作时，比如scrollRectToVisible或setContentOffset:的animated为YES的时候，都会该滚动动画结束的时候调用此方法");
    
    [self resetViewToLeftCenterRightWithShowViewIndex:selIndex];
    [self scrollToCenterViewWithAnimate:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x <= 0) {                                 //滚动到前一页
        NSInteger nextIndex = (currentShowViewIndex==0) ? self.views.count-1 : currentShowViewIndex-1;
        [self resetViewToLeftCenterRightWithShowViewIndex:nextIndex];
        
    }else if(scrollView.contentOffset.x >= scrollView.frame.size.width*2) {//滚动到后一页
        NSInteger nextIndex = (currentShowViewIndex==self.views.count-1) ? 0 : currentShowViewIndex+1;
        [self resetViewToLeftCenterRightWithShowViewIndex:nextIndex];
    }
    
    [self scrollToCenterViewWithAnimate:NO];  //滑动到显示的视图(即中视图)
}

/**
 *  滑动到显示的视图(即中视图)
 *
 *  @param isAnimate 滚动过程中是否要有动画
 */
- (void)scrollToCenterViewWithAnimate:(BOOL)isAnimate {
    if (isAnimate) {
        CGFloat width = CGRectGetWidth(_scrollView.frame);
        CGFloat height = CGRectGetHeight(_scrollView.frame);
        [_scrollView scrollRectToVisible:CGRectMake(width, 0, width, height) animated:YES];
        //注：scrollRectToVisible:有时候会无效(eg:在layoutSubviews里不起作用)，所以当在layoutSubviews里执行的时候请一定选择使用通过设置contentOffset的方式来设置滚动
        
    } else {
        CGFloat width = CGRectGetWidth(_scrollView.frame);
        _scrollView.contentOffset = CGPointMake(width, 0);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
