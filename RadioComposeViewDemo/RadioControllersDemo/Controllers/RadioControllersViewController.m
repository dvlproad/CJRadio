//
//  RadioControllersViewController.m
//  RadioControllersDemo
//
//  Created by 李超前 on 16/8/26.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "RadioControllersViewController.h"
#import "TestDataUtil.h"

@interface RadioControllersViewController () <RadioComposeViewDataSource, RadioComposeViewDelegate> {
    
}
@property (nonatomic, strong) NSArray <UIViewController *> *componentViewControllers;

@end

@implementation RadioControllersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"RadioControllersViewController", nil);
    
    self.componentViewControllers = [TestDataUtil getComponentViewControllers];
    
    self.radioComposeView.dataSource = self;
    self.radioComposeView.delegate = self;
//    self.radioComposeView.scrollType = RadioComposeViewScrollTypeBanScrollHorizontal;
//    [self.radioComposeView scrollToCenterViewWithAnimate:NO];
//    [self.radioComposeView showViewWithIndex:2];
}

//一定不要漏了这个滚动操作
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.radioComposeView scrollToCenterViewWithAnimate:NO];
}

- (BOOL)automaticallyAdjustsScrollViewInsets {
    return NO;
}


- (IBAction)changeShowViewIndex:(id)sender {
    NSInteger viewControllerCount = [self.componentViewControllers count];
    [self.radioComposeView cj_selectComponentAtIndex:random()%viewControllerCount animated:YES];
}

#pragma mark - RadioComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInRadioComposeView:(RadioComposeView *)radioComposeView {
    return 1;
}

- (NSArray<UIView *> *)cj_radioViewsInRadioComposeView:(RadioComposeView *)radioComposeView {
    NSArray *componentViewControllers = self.componentViewControllers;
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIViewController *vc in componentViewControllers) {
        [views addObject:vc.view];
        [self addChildViewController:vc];//记得添加进去
    }
    
    return views;
}


#pragma mark - RadioComposeViewDelegate
- (void)cj_radioComposeView:(RadioComposeView *)radioComposeView didChangeToIndex:(NSInteger)index {
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
