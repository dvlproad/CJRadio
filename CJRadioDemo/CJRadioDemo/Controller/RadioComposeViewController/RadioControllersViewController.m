//
//  RadioControllersViewController.m
//  CJRadioDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "RadioControllersViewController.h"
#import "TestDataUtil.h"

@interface RadioControllersViewController () <CJCycleComposeViewDataSource, CJCycleComposeViewDelegate> {
    
}
@property (nonatomic, strong) NSArray <UIViewController *> *componentViewControllers;

@end

@implementation RadioControllersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"RadioControllersViewController", nil);
    
    self.componentViewControllers = [TestDataUtil getComponentViewControllers];
    
    self.cycleComposeView.dataSource = self;
    self.cycleComposeView.delegate = self;
//    self.CJCycleComposeView.scrollType = CJCycleComposeViewScrollTypeBanScrollHorizontal;
//    [self.CJCycleComposeView scrollToCenterViewWithAnimate:NO];
//    [self.CJCycleComposeView showViewWithIndex:2];
}

//一定不要漏了这个滚动操作
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.cycleComposeView cj_scrollToCenterViewWithAnimated:NO];
}

- (BOOL)automaticallyAdjustsScrollViewInsets {
    return NO;
}


- (IBAction)changeShowViewIndex:(id)sender {
    NSInteger viewControllerCount = [self.componentViewControllers count];
    [self.cycleComposeView cj_selectComponentAtIndex:random()%viewControllerCount animated:YES];
}

#pragma mark - CJCycleComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInCJCycleComposeView:(CJCycleComposeView *)CJCycleComposeView {
    return 1;
}

- (NSArray<UIView *> *)cj_radioViewsInCJCycleComposeView:(CJCycleComposeView *)CJCycleComposeView {
    NSArray *componentViewControllers = self.componentViewControllers;
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIViewController *vc in componentViewControllers) {
        [views addObject:vc.view];
        [self addChildViewController:vc];//记得添加进去
    }
    
    return views;
}


#pragma mark - CJCycleComposeViewDelegate
- (void)cj_CJCycleComposeView:(CJCycleComposeView *)CJCycleComposeView didChangeToIndex:(NSInteger)index {
    NSLog(@"点击了%ld", index);
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
