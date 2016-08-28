//
//  RadioControllersViewController.m
//  RadioControllersDemo
//
//  Created by 李超前 on 16/8/26.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "RadioControllersViewController.h"

@interface RadioControllersViewController () <RadioControllersDelegate> {
    
}

@end

@implementation RadioControllersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSArray *radioViewControllers = [self getRadioControllers];
    self.defaultSelectedIndex = 2;
    [self initizileRadioControllersViewWithRadioControllers:radioViewControllers];
}

- (BOOL)automaticallyAdjustsScrollViewInsets {
    return NO;
}


- (NSArray<UIViewController *> *)getRadioControllers {
    /* 设置radioControllers（黄橙相间） */
    NSMutableArray *radioControllers = [[NSMutableArray alloc] init];
    
    UIViewController *home1 = [[UIViewController alloc]init];
    home1.view.backgroundColor = [UIColor yellowColor];
    [radioControllers addObject:home1];
    
    UIViewController *home2 = [[UIViewController alloc]init];
    home2.view.backgroundColor = [UIColor orangeColor];
    [radioControllers addObject:home2];
    
    UIViewController *home3 = [[UIViewController alloc]init];
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


/*
*  初始化数据（按钮和控制器）
*/
- (void)initizileRadioControllersViewWithRadioControllers:(NSArray<UIViewController *> *)radioControllers {
    if (self.radioControllersView.views.count == 0) {
        NSMutableArray *views = [[NSMutableArray alloc] init];
        for (UIViewController *vc in radioControllers) {
            [views addObject:vc.view];
            [self addChildViewController:vc];//记得添加进去
        }
        //[self.radioControllersView setScrollViews:views];
        [self.radioControllersView setScrollViews:views andShowIndex:self.defaultSelectedIndex];
        [self.radioControllersView setDelegate:self];
    }
}


- (void)radioControllersDidChangeToIndex:(NSInteger)index {
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
