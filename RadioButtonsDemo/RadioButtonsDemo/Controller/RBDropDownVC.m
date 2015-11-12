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
    RadioButtons_DropDown *rb_dropdown1 = [[RadioButtons_DropDown alloc]initWithFrame:rect_rbDropDwon1];
    [rb_dropdown1 setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    rb_dropdown1.delegate = self;
    rb_dropdown1.tag = 111;
    [self.view addSubview:rb_dropdown1];
}

//点击时候会调用如下委托：
- (void)radioButtons:(RadioButtons_DropDown *)radioButtons chooseIndex:(NSInteger)index{
    NSLog(@"当前选择的是%d", index);
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100)];
    customView.backgroundColor = [UIColor greenColor];
    [radioButtons showDropDownExtendView:customView inView:self.view complete:nil];//弹出下拉视图
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
