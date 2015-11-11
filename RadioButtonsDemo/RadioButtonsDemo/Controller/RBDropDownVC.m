//
//  RBDropDownVC.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBDropDownVC.h"

@interface RBDropDownVC ()

@end

@implementation RBDropDownVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark 此例中如果RBDropDownVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    CGRect rect_radioButton = CGRectMake(60, 84, 200, 40);
    RadioButton *btn = [[RadioButton alloc]initWithNibNamed:@"RadioButton_DropDown" frame:rect_radioButton];
    [btn setTitle:@"测试,无下拉"];
    [self.view addSubview:btn];
    
    CGRect rect_radioButtons111 = CGRectMake(0, 164, 320, 40);
    commonRadioButtons111 = [[RadioButtons_DropDown alloc]initWithFrame:rect_radioButtons111];
    [commonRadioButtons111 setTitles:@[@"人物", @"爱好"] radioButtonNidName:@"RadioButton_DropDown"];
    commonRadioButtons111.delegate = self;
    commonRadioButtons111.tag = 111;
    [self.view addSubview:commonRadioButtons111];
    
    CGRect rect_radioButtons222 = CGRectMake(0, 264, 320, 40);
    commonRadioButtons222 = [[RadioButtons_DropDown alloc]initWithFrame:rect_radioButtons222];
    [commonRadioButtons222 setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    commonRadioButtons222.delegate = self;
    commonRadioButtons222.tag = 222;
    [self.view addSubview:commonRadioButtons222];
    
}

- (void)radioButtons:(RadioButtons_DropDown *)radioButtons chooseIndex:(NSInteger)index{
    NSLog(@"当前选择的是%d", index);
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100)];
    customView.backgroundColor = [UIColor greenColor];
    [radioButtons showDropDownExtendView:customView inView:self.view complete:nil];
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
