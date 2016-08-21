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
    rbCanDrop = [[RadioButtons alloc]initWithFrame:rect_rbCanDrop];
    [rbCanDrop setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    rbCanDrop.delegate = self;
    rbCanDrop.tag = 222;
    [self.view addSubview:rbCanDrop];
}

- (void)radioButtons:(RadioButtons *)radioButtonsCanDrop chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    BOOL isSameIndex = index_cur == index_old ? YES : NO;

    if (isSameIndex) {
        [radioButtonsCanDrop cj_hideDropDownExtendView];
        [radioButtonsCanDrop setIndex_cur:-1];
        
    } else {
        UIView *popupView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 199)];
        popupView.clipsToBounds = YES;
        popupView.backgroundColor = [UIColor greenColor];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20, 50, 280, 44)];
        [btn setTitle:@"生成随机数，并设置" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [popupView addSubview:btn];
        
        
        __weak typeof(RadioButtons *)weakRadioButtonsCanDrop = radioButtonsCanDrop;
        CJTapViewTappedAction cjTapViewTappedAction = ^(UIView *view) {
            RadioButton *radioButton = (RadioButton *)[weakRadioButtonsCanDrop viewWithTag:RadioButton_TAG_BEGIN + radioButtonsCanDrop.index_cur];
            radioButton.selected = !radioButton.selected;
        
            [weakRadioButtonsCanDrop cj_hideDropDownExtendView];
            [weakRadioButtonsCanDrop setIndex_cur:-1];
        };
        radioButtonsCanDrop.cjTapViewTappedAction = cjTapViewTappedAction;

        [radioButtonsCanDrop cj_showDropDownExtendView:popupView withShowInView:self.view completeBlock:nil];
};
    
}

- (IBAction)btnAction:(id)sender{
    NSString *text = [NSString stringWithFormat:@"%d", rand()%10];
    [rbCanDrop radioButtons_didSelectInExtendView:text];
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
