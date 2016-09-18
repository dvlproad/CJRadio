//
//  SliderViewController2.m
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "SliderViewController2.h"

@interface SliderViewController2 () <CJButtonControllerViewDataSource, CJButtonControllerViewDelegate>

@end

@implementation SliderViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.buttonControllerView.titles =  @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    self.buttonControllerView.showLineImageView = YES;
    self.buttonControllerView.lineImage = [UIImage imageNamed:@"arrowUp"];
    self.buttonControllerView.lineImageViewHeight = 6;
    [self.buttonControllerView addLeftArrowImage:[UIImage imageNamed:@"arrowLeft_red"]
                                 rightArrowImage:[UIImage imageNamed:@"arrowRight_red"]
                             withArrowImageWidth:20];
    
    self.buttonControllerView.componentViewControllers = [self getComponentViewControllers];
    self.buttonControllerView.componentViewParentViewController = self;
    
    self.buttonControllerView.defaultSelectedIndex = 1;
    self.buttonControllerView.maxRadioButtonsShowViewCount = 4;
    self.buttonControllerView.radioButtonsHeight = 50;
    
    self.buttonControllerView.dataSource = self;
    self.buttonControllerView.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.buttonControllerView addRadioButtonsLeftView:button withWidth:60];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_normal"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"addChannel_selected"] forState:UIControlStateSelected];
    [self.buttonControllerView addRadioButtonsRightView:rightButton withWidth:40];
    
    [self.buttonControllerView reloadData];
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

#pragma mark - CJButtonControllerViewDataSource && CJButtonControllerViewDelegate
- (RadioButton *)cj_buttonControllerView:(CJButtonControllerView *)buttonControllerView cellForComponentAtIndex:(NSInteger)index {
    NSArray *radioButtonNib = [[NSBundle mainBundle]loadNibNamed:@"RadioButton_Slider" owner:nil options:nil];
    RadioButton *radioButton = [radioButtonNib lastObject];
    
    radioButton.textNormalColor = [UIColor blackColor];
    radioButton.textSelectedColor = [UIColor whiteColor];
    
    return radioButton;
}

- (void)cj_buttonControllerView:(CJButtonControllerView *)buttonControllerView didChangeToIndex:(NSInteger)index {
    NSLog(@"didChangeToIndex = %ld", index);
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
