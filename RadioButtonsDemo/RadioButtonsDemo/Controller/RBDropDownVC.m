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
    CGRect rect_rbDropDwon1 = CGRectMake(0, 164, 320, 40);
    rb_dropdown = [[RadioButtons_DropDown alloc]initWithFrame:rect_rbDropDwon1];
    [rb_dropdown setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    rb_dropdown.delegate = self;
    rb_dropdown.tag = 111;
    [self.view addSubview:rb_dropdown];
}

//点击时候会调用如下委托：
- (void)radioButtons:(RadioButtons_DropDown *)radioButtons chooseIndex:(NSInteger)index{
    NSLog(@"当前选择的是%d", index);
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100)];
    customView.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(20, 50, CGRectGetWidth(customView.frame)-40, 44)];
    [btn setTitle:@"生成随机数，并设置" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:btn];
    [radioButtons showDropDownView:customView inView:self.view complete:nil];//弹出下拉视图
}

- (IBAction)btnAction:(id)sender{
    NSString *title = [NSString stringWithFormat:@"%d", rand()%10];
    [rb_dropdown didSelectInDropDownView_rbDropDown:title];
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
