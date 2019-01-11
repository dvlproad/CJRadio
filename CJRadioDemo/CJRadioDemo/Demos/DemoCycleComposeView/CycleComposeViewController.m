//
//  CycleComposeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "CycleComposeViewController.h"
#import "CustomSliderVCElementFactory.h"

@interface CycleComposeViewController () <CJCycleComposeViewDataSource, CJCycleComposeViewDelegate> {
    
}
@property (nonatomic, strong) NSArray <UIViewController *> *componentViewControllers;

@end

@implementation CycleComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"CycleComposeViewController", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.componentViewControllers = [CustomSliderVCElementFactory demoComponentViewControllers];
    
    self.cycleComposeView.dataSource = self;
    self.cycleComposeView.delegate = self;
    self.cycleComposeView.scrollType = CJCycleComposeViewScrollTypeBanScrollCycle;//设置禁止循环在滚动到最大的时候有bug
//    self.cycleComposeView.scrollType = CJCycleComposeViewScrollTypeBanScrollHorizontal;
//    [self.cycleComposeView cj_selectComponentAtIndex:2 animated:YES];
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
    return 0;
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
- (void)cj_cycleComposeView:(CJCycleComposeView *)cycleComposeView didChangeToIndex:(NSInteger)index {
    NSLog(@"切换到了第%ld视图", index);
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
