//
//  CJSliderViewController.m
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "CJSliderViewController.h"

static NSInteger kMaxRadioButtonsShowViewCountDefault = 3;
static NSInteger kSelectedIndexDefault = 2;

@interface CJSliderViewController () <RadioButtonsDelegate, RadioControllersDelegate> {
    
}

@end

@implementation CJSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"我的首页", nil);

    
    NSArray *radioButtonTitles =  @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    NSString *radioButtonNibName = @"RadioButton_Slider";
    
    NSArray *radioViewControllers = [self getRadioControllers];
    
    self.defaultSelectedIndex = kSelectedIndexDefault;
    self.maxRadioButtonsShowViewCount = kMaxRadioButtonsShowViewCountDefault;
    [self setupViewWithRadioButtonTitles:radioButtonTitles
                      radioButtonNibName:radioButtonNibName
                    radioViewControllers:radioViewControllers];
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

- (void)setupViewWithRadioButtonTitles:(NSArray<NSString *> *)radioButtonTitles radioButtonNibName:(NSString *)radioButtonNidName radioViewControllers:(NSArray<UIViewController *> *)radioControllers {
    
    //RadioButtons
    [self initizileRadioButtonsWithRadioButtonTitles:radioButtonTitles radioButtonNibName:radioButtonNidName];
    
    //RadioControllers
    [self initizileRadioControllersViewWithRadioControllers:radioControllers];
    
}




/**
 *  初始化数据（单选按钮）
 */
- (void)initizileRadioButtonsWithRadioButtonTitles:(NSArray<NSString *> *)radioButtonTitles
                                radioButtonNibName:(NSString *)radioButtonNidName {
    [self.radioButtons setTitles:radioButtonTitles radioButtonNidName:radioButtonNidName];
    self.radioButtons.defaultSelectedIndex = self.defaultSelectedIndex;
    self.radioButtons.maxShowViewCount = self.maxRadioButtonsShowViewCount;
    self.radioButtons.shouldMoveScrollViewToSelectItem = YES;
    [self.radioButtons setDelegate:self];
    [self.radioButtons addLeftArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                         rightArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                     withArrowImageWidth:20];
}




/**
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




#pragma mark - RadioButtonsDelegate & RadioControllersDelegate
- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    [self.radioControllersView showViewWithIndex:index_cur];
    self.currentSelectedIndex = index_cur;
    
    [self doSomethingToCon_whereIndex:index_cur];
}

- (void)radioControllersDidChangeToIndex:(NSInteger)index {
    [self.radioButtons selectRadioButtonIndex:index];
    self.currentSelectedIndex  = index;
    
    [self doSomethingToCon_whereIndex:index];
}



#pragma mark - 子类可选的继承方法
- (void)doSomethingToCon_whereIndex:(NSInteger)index {//若有类继承自此类，子类做一些额外的操作，比如“强制刷新”的操作
    
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
