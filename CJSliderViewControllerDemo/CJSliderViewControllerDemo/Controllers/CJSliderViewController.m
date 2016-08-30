//
//  CJSliderViewController.m
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "CJSliderViewController.h"

static NSInteger kMaxRadioButtonsShowViewCountDefault = 4;
static NSInteger kSelectedIndexDefault = 2;

@interface CJSliderViewController () <RadioButtonsDataSource, RadioButtonsDelegate, RadioComposeViewDataSource, RadioComposeViewDelegate> {
    NSArray *titles;
}

@end

@implementation CJSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"我的首页", nil);

    //RadioButtons
    titles =  @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    [self.sliderRadioButtons addLeftArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                               rightArrowImage:[UIImage imageNamed:@"btnTab_BG_selected"]
                           withArrowImageWidth:20];
    self.sliderRadioButtons.dataSource = self;
    self.sliderRadioButtons.delegate = self;
    
    //RadioControllers
    self.radioComposeView.dataSource = self;
    self.radioComposeView.delegate = self;
    
    //Self
    self.defaultSelectedIndex = kSelectedIndexDefault;
    self.maxRadioButtonsShowViewCount = kMaxRadioButtonsShowViewCountDefault;
}

- (BOOL)automaticallyAdjustsScrollViewInsets {
    return NO;
}


#pragma mark - RadioButtonsDataSource
- (NSInteger)cj_defaultShowIndexInRadioButtons:(RadioButtons *)radioButtons {
    return self.defaultSelectedIndex;
}

- (NSInteger)cj_numberOfComponentsInRadioButtons:(RadioButtons *)radioButtons {
    return titles.count;
}

- (CGFloat)cj_radioButtons:(RadioButtons *)radioButtons widthForComponentAtIndex:(NSInteger)index  {
    NSInteger showViewCount = MIN(titles.count, kMaxRadioButtonsShowViewCountDefault);
    CGFloat sectionWidth = CGRectGetWidth(radioButtons.frame)/showViewCount;
    sectionWidth = ceilf(sectionWidth); //重点注意：当使用除法计算width时候，为了避免计算出来的值受除后，余数太多，除不尽(eg:102.66666666666667)，而造成的之后在通过左右箭头点击来寻找”要找的按钮“的时候，计算出现问题（”要找的按钮“需与“左右侧箭头的最左最右侧值”进行精确的比较），所以这里我们需要一个整数值，故我们这边选择向上取整。
    
    return sectionWidth;
}

- (RadioButton *)cj_radioButtons:(RadioButtons *)radioButtons cellForComponentAtIndex:(NSInteger)index {
    NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"RadioButton_Slider" owner:nil options:nil];
    RadioButton *radioButton = [radioButtonNib lastObject];
    [radioButton setTitle:titles[index]];
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor greenColor];
    
    return radioButton;
}


#pragma mark - RadioComposeViewDataSource
- (NSInteger)cj_defaultShowIndexInRadioComposeView:(RadioComposeView *)radioComposeView {
    return self.defaultSelectedIndex;
}

- (NSArray<UIView *> *)cj_radioViewsInRadioComposeView:(RadioComposeView *)radioComposeView {
    NSArray *radioViewControllers = [self getRadioControllers];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIViewController *vc in radioViewControllers) {
        [views addObject:vc.view];
        [self addChildViewController:vc];//记得添加进去
    }
    
    return views;
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

#pragma mark - RadioButtonsDelegate & RadioComposeViewDelegate
- (void)cj_radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    //NSLog(@"index_old = %ld, index_cur = %ld", index_old, index_cur);
    [self.radioComposeView showViewWithIndex:index_cur];
    self.currentSelectedIndex = index_cur;
    
    [self doSomethingToCon_whereIndex:index_cur];
}

- (void)cj_radioComposeView:(RadioComposeView *)radioComposeView didChangeToIndex:(NSInteger)index {
    [self.sliderRadioButtons cj_selectComponentAtIndex:index animated:YES];
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
