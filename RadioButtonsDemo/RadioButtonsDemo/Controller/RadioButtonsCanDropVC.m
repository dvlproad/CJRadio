//
//  RadioButtonsCanDropVC.m
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/16.
//  Copyright © 2015年 dvlproad. All rights reserved.
//

#import "RadioButtonsCanDropVC.h"

@interface RadioButtonsCanDropVC ()

@end

@implementation RadioButtonsCanDropVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect rect_rbCanDrop = CGRectMake(0, 164, self.view.frame.size.width, 40);
    rbCanDrop = [[RadioButtonsCanDrop alloc]initWithFrame:rect_rbCanDrop];
    [rbCanDrop setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    rbCanDrop.delegate = self;
    rbCanDrop.tag = 222;
    [self.view addSubview:rbCanDrop];
}

- (void)radioButtonsCanDrop:(RadioButtonsCanDrop *)radioButtonsCanDrop chooseIndex:(NSInteger)index{
    UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
    popupView.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(20, 50, 280, 44)];
    [btn setTitle:@"生成随机数，并设置" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [popupView addSubview:btn];
    
    [radioButtonsCanDrop radioButtonsCanDrop_showDropDownExtendView:popupView inView:self.view complete:nil];
}

- (IBAction)btnAction:(id)sender{
    NSString *text = [NSString stringWithFormat:@"%d", rand()%10];
    [rbCanDrop radioButtonsCanDrop_didSelectInExtendView:text];
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
