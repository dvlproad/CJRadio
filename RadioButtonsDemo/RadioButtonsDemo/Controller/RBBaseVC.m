//
//  RBBaseVC.m
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/12.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "RBBaseVC.h"

@interface RBBaseVC ()

@end

@implementation RBBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    #pragma mark 此例中如果RBDropDownVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    CGRect rect_radioButton = CGRectMake(50, 84, 220, 40);
    RadioButton *btn = [[RadioButton alloc]initWithNibNamed:@"RadioButton_DropDown" frame:rect_radioButton];
    [btn setTitle:@"测试btn的setTitle,无下拉"];
    [self.view addSubview:btn];
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
