//
//  RBSliderVC.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBSliderVC.h"

@interface RBSliderVC ()

@end

@implementation RBSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor greenColor];
    
#pragma mark 此例中如果RBSlierVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    rb_slider = [[RadioButtons_Slider alloc]initWithFrame:CGRectMake(0, 100, 320, 40)];
    NSArray *radioButtonNames =  @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    [rb_slider setTitles:radioButtonNames radioButtonNidName:@"RadioButton_Slider" andShowIndex:4];
    [rb_slider setDelegate:self];
    [self.view addSubview:rb_slider];
}

- (void)radioButtons:(RadioButtons_Slider *)radioButtons chooseIndex:(NSInteger)index{
    NSLog(@"当前选择的是%d", index);
    
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
