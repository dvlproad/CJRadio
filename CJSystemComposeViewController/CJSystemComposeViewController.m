//
//  CJSystemComposeViewController.m
//  RadioComposeViewDemo
//
//  Created by dvlproad on 2017/1/10.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJSystemComposeViewController.h"

@interface CJSystemComposeViewController ()

@end

@implementation CJSystemComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentSelectedIndex = 0;
}

- (void)setComponentViewControllers:(NSArray *)componentViewControllers {
    _componentViewControllers = componentViewControllers;
    
    NSInteger count = componentViewControllers.count;
    for (NSInteger index = 0; index < count; index++) {
        UIViewController *viewController = [componentViewControllers objectAtIndex:index];
        if (index == self.currentSelectedIndex) {
            [self cj_makeView:self.radioComposeView addSubView:viewController.view withEdgeInsets:UIEdgeInsetsZero];
            
            [self addChildViewController:viewController];
        }
    }
}


- (void)cj_chooseViewControllerIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old completeBlock:(void(^)(NSInteger index_cur))completeBlock {
    //NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
    //[self.radioComposeView cj_selectComponentAtIndex:index_cur animated:YES];
    if (index_cur == index_old) {
        return;
    }
    
    UIViewController *newShowViewController = [self.componentViewControllers objectAtIndex:index_cur];
    UIViewController *oldShowViewController = [self.componentViewControllers objectAtIndex:index_old];
    [self addChildViewController:newShowViewController];
    [self cj_makeView:self.radioComposeView addSubView:newShowViewController.view withEdgeInsets:UIEdgeInsetsZero];
    
    
    [self transitionFromViewController:oldShowViewController
                      toViewController:newShowViewController
                              duration:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                                  
                              } completion:^(BOOL finished) {
                                  if (finished) {
                                      [newShowViewController didMoveToParentViewController:self];
                                      [oldShowViewController willMoveToParentViewController:nil];
                                      [oldShowViewController.view removeFromSuperview];
                                      [oldShowViewController removeFromParentViewController];
                                      
                                      self.currentSelectedIndex = index_cur;
                                  } else {
                                      
                                      self.currentSelectedIndex = index_old;
                                  }
                              }];
    
    if (completeBlock) {
        completeBlock(index_cur);
    }
}


#pragma mark - addSubView
- (void)cj_makeView:(UIView *)superView addSubView:(UIView *)subView withEdgeInsets:(UIEdgeInsets)edgeInsets {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
