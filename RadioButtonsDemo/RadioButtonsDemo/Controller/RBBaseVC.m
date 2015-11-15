//
//  RBBaseVC.m
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/12.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "RBBaseVC.h"
#import <CJPopupView/CJPopupView.h>

@interface RBBaseVC ()

@end

@implementation RBBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    #pragma mark 此例中如果RBBaseVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    CGRect rect_radioButton = CGRectMake(50, 84, 220, 40);
    RadioButton *btn = [[RadioButton alloc]initWithNibNamed:@"RadioButton_DropDown" frame:rect_radioButton];
    [btn setTitle:@"测试btn的setTitle,无下拉"];
    [self.view addSubview:btn];
    
#pragma mark 此例中如果RBBaseVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    CGRect rect_radioButtons = CGRectMake(0, 164, 320, 40);
    rbs = [[RadioButtons alloc]initWithFrame:rect_radioButtons];
    [rbs setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_Slider" andShowIndex:1];
    rbs.delegate = self;
    rbs.tag = 111;
    [self.view addSubview:rbs];
}

- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old{
    
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
