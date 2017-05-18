//
//  CJCycleCollectionView.m
//  CJRadioDemo
//
//  Created by 李超前 on 2017/5/15.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJCycleCollectionView.h"

@interface CJCycleCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate> {
    
}
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;

@end



@implementation CJCycleCollectionView

- (id)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self commonInit];
}


- (void)commonInit {
    
}


//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return _totalItemsCount;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    SDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    long itemIndex = [self pageControlIndexWithCurrentCellIndex:indexPath.item];
//    
//    NSString *imagePath = self.imagePathsGroup[itemIndex];
//    
//    if (!self.onlyDisplayText && [imagePath isKindOfClass:[NSString class]]) {
//        if ([imagePath hasPrefix:@"http"]) {
//            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:self.placeholderImage];
//        } else {
//            UIImage *image = [UIImage imageNamed:imagePath];
//            if (!image) {
//                [UIImage imageWithContentsOfFile:imagePath];
//            }
//            cell.imageView.image = image;
//        }
//    } else if (!self.onlyDisplayText && [imagePath isKindOfClass:[UIImage class]]) {
//        cell.imageView.image = (UIImage *)imagePath;
//    }
//    
//    if (_titlesGroup.count && itemIndex < _titlesGroup.count) {
//        cell.title = _titlesGroup[itemIndex];
//    }
//    
//    if (!cell.hasConfigured) {
//        cell.titleLabelBackgroundColor = self.titleLabelBackgroundColor;
//        cell.titleLabelHeight = self.titleLabelHeight;
//        cell.titleLabelTextAlignment = self.titleLabelTextAlignment;
//        cell.titleLabelTextColor = self.titleLabelTextColor;
//        cell.titleLabelTextFont = self.titleLabelTextFont;
//        cell.hasConfigured = YES;
//        cell.imageView.contentMode = self.bannerImageViewContentMode;
//        cell.clipsToBounds = YES;
//        cell.onlyDisplayText = self.onlyDisplayText;
//    }
//    
//    return cell;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
//        [self.delegate cycleScrollView:self didSelectItemAtIndex:[self pageControlIndexWithCurrentCellIndex:indexPath.item]];
//    }
//    if (self.clickItemOperationBlock) {
//        self.clickItemOperationBlock([self pageControlIndexWithCurrentCellIndex:indexPath.item]);
//    }
//}
//

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if (!self.imagePathsGroup.count) return; // 解决清除timer时偶尔会出现的问题
//    int itemIndex = [self currentIndex];
//    int indexOnPageControl = [self pageControlIndexWithCurrentCellIndex:itemIndex];
//    
//    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
//        TAPageControl *pageControl = (TAPageControl *)_pageControl;
//        pageControl.currentPage = indexOnPageControl;
//    } else {
//        UIPageControl *pageControl = (UIPageControl *)_pageControl;
//        pageControl.currentPage = indexOnPageControl;
//    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    if (self.autoScroll) {
//        [self invalidateTimer];
//    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    if (self.autoScroll) {
//        [self setupTimer];
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    [self scrollViewDidEndScrollingAnimation:self.collectionView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
//    if (!self.imagePathsGroup.count) return; // 解决清除timer时偶尔会出现的问题
//    int itemIndex = [self currentIndex];
//    int indexOnPageControl = [self pageControlIndexWithCurrentCellIndex:itemIndex];
//    
//    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didScrollToIndex:)]) {
//        [self.delegate cycleScrollView:self didScrollToIndex:indexOnPageControl];
//    } else if (self.itemDidScrollOperationBlock) {
//        self.itemDidScrollOperationBlock(indexOnPageControl);
//    }
}


@end
