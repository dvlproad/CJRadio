//
//  RBDropDownVC.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBDropDownVC.h"
#import <CJPopupView/CJPopupView.h>

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

- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old{
    
    switch (index_cur) {
        case 0:
        {
            if (index_cur == index_old) {
                [popupView1 dismissPopupView_popupInView];
                radioButtons.index_cur = -1;  //设置成-1表示当前未选中任何radioButton
                return;
                
            }else if (index_old == 1) {
                [popupView2 dismissPopupView_popupInView];
            }else if (index_old == 2){
                [popupView3 dismissPopupView_popupInView];
            }else if (index_old == 3){
                [popupView4 dismissPopupView_popupInView];
            }
            
            
            if (popupView1 == nil) {
                UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
                popupView.backgroundColor = [UIColor greenColor];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setFrame:CGRectMake(20, 50, 280, 44)];
                [btn setTitle:@"1.生成随机数，并设置" forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor redColor]];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [popupView addSubview:btn];
                
                popupView1 = popupView;
                popupView1.tag = 1001;
            }
            
            CGFloat h_popupView = 100;
            UIView *sender = radioButtons;
            UIView *popupSuperview = self.view;
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            
            [popupView1 popupInView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView complete:nil];
            [popupView1 setBlockTapBGComplete:^{
                RadioButton *radioButton = (RadioButton *)[radioButtons curRadioButton];
                radioButton.selected = !radioButton.selected;
                radioButtons.index_cur = -1;
                
            } blockHideDropDownViewComplete:^{
                
            }];
            
            break;
        }
        case 1:
        {
            if (index_cur == index_old) {
                [popupView2 dismissPopupView_popupInView];
                radioButtons.index_cur = -1;  //设置成-1表示当前未选中任何radioButton
                return;
                
            }else if (index_old == 0) {
                [popupView1 dismissPopupView_popupInView];
            }else if (index_old == 2){
                [popupView3 dismissPopupView_popupInView];
            }else if (index_old == 3){
                [popupView4 dismissPopupView_popupInView];
            }
            
            
            if (popupView2 == nil) {
                UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
                popupView.backgroundColor = [UIColor greenColor];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setFrame:CGRectMake(20, 50, 280, 44)];
                [btn setTitle:@"2.生成随机数，并设置" forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor redColor]];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [popupView addSubview:btn];
                
                popupView2 = popupView;
                popupView2.tag = 1001;
            }
            
            CGFloat h_popupView = 100;
            UIView *sender = radioButtons;
            UIView *popupSuperview = self.view;
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            
            [popupView2 popupInView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView complete:nil];
            [popupView2 setBlockTapBGComplete:^{
                RadioButton *radioButton = (RadioButton *)[radioButtons curRadioButton];
                radioButton.selected = !radioButton.selected;
                radioButtons.index_cur = -1;
                
            } blockHideDropDownViewComplete:^{
                
            }];
            break;
        }
        case 2:
        {
            if (index_cur == index_old) {
                [popupView3 dismissPopupView_popupInView];
                radioButtons.index_cur = -1;  //设置成-1表示当前未选中任何radioButton
                return;
                
            }else if (index_old == 0) {
                [popupView1 dismissPopupView_popupInView];
            }else if (index_old == 1){
                [popupView2 dismissPopupView_popupInView];
            }else if (index_old == 3){
                [popupView4 dismissPopupView_popupInView];
            }
            
            
            if (popupView3 == nil) {
                UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
                popupView.backgroundColor = [UIColor greenColor];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setFrame:CGRectMake(20, 50, 280, 44)];
                [btn setTitle:@"3.生成随机数，并设置" forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor redColor]];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [popupView addSubview:btn];
                
                popupView3 = popupView;
                popupView3.tag = 1001;
            }
            
            CGFloat h_popupView = 100;
            UIView *sender = radioButtons;
            UIView *popupSuperview = self.view;
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            
            [popupView3 popupInView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView complete:nil];
            [popupView3 setBlockTapBGComplete:^{
                RadioButton *radioButton = (RadioButton *)[radioButtons curRadioButton];
                radioButton.selected = !radioButton.selected;
                radioButtons.index_cur = -1;
                
            } blockHideDropDownViewComplete:^{
                
            }];
            break;
        }
        case 3:
        {
            if (index_cur == index_old) {
                [popupView4 dismissPopupView_popupInView];
                radioButtons.index_cur = -1;  //设置成-1表示当前未选中任何radioButton
                return;
                
            }else if (index_old == 0) {
                [popupView1 dismissPopupView_popupInView];
            }else if (index_old == 1){
                [popupView2 dismissPopupView_popupInView];
            }else if (index_old == 2){
                [popupView3 dismissPopupView_popupInView];
            }
            
            
            if (popupView4 == nil) {
                UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
                popupView.backgroundColor = [UIColor greenColor];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setFrame:CGRectMake(20, 50, 280, 44)];
                [btn setTitle:@"4.生成随机数，并设置" forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor redColor]];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [popupView addSubview:btn];
                
                popupView4 = popupView;
                popupView4.tag = 1001;
            }
            
            CGFloat h_popupView = 100;
            UIView *sender = radioButtons;
            UIView *popupSuperview = self.view;
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            
            [popupView4 popupInView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView complete:nil];
            [popupView4 setBlockTapBGComplete:^{
                RadioButton *radioButton = (RadioButton *)[radioButtons curRadioButton];
                radioButton.selected = !radioButton.selected;
                radioButtons.index_cur = -1;
                
            } blockHideDropDownViewComplete:^{
                
            }];
            break;
        }
        default:
            break;
    }
}

- (IBAction)btnAction:(id)sender{
    NSString *title = [NSString stringWithFormat:@"%d", rand()%10];
    RadioButton *radioButton_cur = (RadioButton *)[rb_dropdown viewWithTag:RadioButton_TAG_BEGIN + rb_dropdown.index_cur];
    radioButton_cur.selected = !radioButton_cur.selected;
    [radioButton_cur setTitle:title];
    
    
    NSInteger index_old = rb_dropdown.index_cur;
    rb_dropdown.index_cur = -1;
    if (index_old == 0) {
        [popupView1 dismissPopupView_popupInView];
    }else if (index_old == 1) {
        [popupView2 dismissPopupView_popupInView];
    }else if (index_old == 2){
        [popupView3 dismissPopupView_popupInView];
    }else if (index_old == 3){
        [popupView4 dismissPopupView_popupInView];
    }
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
