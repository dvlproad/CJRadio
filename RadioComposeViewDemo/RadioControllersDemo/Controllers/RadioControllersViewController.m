//
//  RadioControllersViewController.m
//  RadioControllersDemo
//
//  Created by 李超前 on 16/8/26.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "RadioControllersViewController.h"
#import "Home1.h"

@interface RadioControllersViewController () <RadioComposeViewDataSource, RadioComposeViewDelegate> {
    
}
@property (nonatomic, strong) NSArray <UIViewController *> *componentViewControllers;

@end

@implementation RadioControllersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.componentViewControllers = [self getComponentViewControllers];
    
    self.radioComposeView.dataSource = self;
    self.radioComposeView.delegate = self;
    self.radioComposeView.scrollType = RadioComposeViewScrollTypeBanScrollHorizontal;
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
    [self.radioComposeView showViewWithIndex:random()%viewControllerCount];
}

- (NSArray<UIViewController *> *)getComponentViewControllers {
    /* 设置radioControllers（黄橙相间） */
    NSMutableArray *radioControllers = [[NSMutableArray alloc] init];
    
    UIViewController *home1 = [[UIViewController alloc]init];
    home1.view.backgroundColor = [UIColor yellowColor];
    [radioControllers addObject:home1];
    
    UIViewController *home2 = [[UIViewController alloc]init];
    home2.view.backgroundColor = [UIColor orangeColor];
    [radioControllers addObject:home2];
    
//    UIViewController *home3 = [[UIViewController alloc]init];
    Home1 *home3 = [[Home1 alloc] initWithNibName:@"Home1" bundle:nil];
    home3.view.backgroundColor = [UIColor yellowColor];
    [radioControllers addObject:home3];
    
    UIViewController *home4 = [[UIViewController alloc]init];
    home4.view.backgroundColor = [UIColor orangeColor];
    [radioControllers addObject:home4];
    
    UIViewController *home5 = [[UIViewController alloc]init];
    home5.view.backgroundColor = [UIColor yellowColor];
    [radioControllers addObject:home5];
    
    UIViewController *home6 = [[UIViewController alloc]init];
    home6.view.backgroundColor = [UIColor orangeColor];
    [radioControllers addObject:home6];
    
    for (NSInteger i = 0; i < radioControllers.count; i++) {
        UIViewController *viewController = [radioControllers objectAtIndex:i];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
        label.backgroundColor = [UIColor cyanColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:40];
        label.text = [NSString stringWithFormat:@"This is home%zd", i+1];
        [viewController.view addSubview:label];
    }
    
    return radioControllers;
}


#pragma mark - RadioComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInRadioComposeView:(RadioComposeView *)radioComposeView {
    return 2;
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
