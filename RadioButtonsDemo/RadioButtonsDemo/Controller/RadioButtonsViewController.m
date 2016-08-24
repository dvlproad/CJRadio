//
//  RadioButtonsViewController.m
//  RadioButtonsDemo
//
//  Created by 李超前 on 15/11/12.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "RadioButtonsViewController.h"

@interface RadioButtonsViewController ()

@end

@implementation RadioButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//#pragma mark 此例中如果RBBaseVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
//    CGRect radioButtonRect = CGRectMake(50, 84, 220, 40);
//    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"RadioButton_DropDown" owner:nil options:nil];
//    RadioButton *radioButton = [array lastObject];
//    [radioButton setFrame:radioButtonRect];
//    
//    [radioButton setTitle:@"测试btn的setTitle,无下拉"];
//    [self.view addSubview:radioButton];
//    
//#pragma mark 此例中如果RBBaseVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
//    CGRect rect_radioButtons = CGRectMake(0, 164, 320, 40);
//    rbs = [[RadioButtons alloc]initWithFrame:rect_radioButtons];
//    [rbs setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_Slider" andShowIndex:1];
//    rbs.delegate = self;
//    rbs.tag = 111;
//    [self.view addSubview:rbs];
    
    
    
    radioButtonNames = @[@"Home1第一页", @"Home2", @"Home3是佛恩", @"Home4天赐的爱", @"Home5你是礼物", @"Home6"];
    radioButtonNidName = @"RadioButton_Slider";
    selectIndex = 0;
    [self.radioButtons setTitles:radioButtonNames radioButtonNidName:radioButtonNidName];
    self.radioButtons.defaultSelectedIndex = selectIndex;
    self.radioButtons.maxShowViewCount = 3;
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
