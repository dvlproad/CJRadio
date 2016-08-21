//
//  RBDropDownBestVC.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "RBDropDownBestVC.h"
#import <CJPopupView/UIView+ShowPopupInViewIndependentCode.h>

@interface RBDropDownBestVC ()

@end

@implementation RBDropDownBestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    #pragma mark 此例中如果RBDropDownVC.xib没有去掉sizeClasses，则容易出现视图无显示问题
    CGRect rect_rbDropDwon1 = CGRectMake(0, 164, 320, 40);
    rb_dropdown = [[RadioButtons alloc]initWithFrame:rect_rbDropDwon1];
    [rb_dropdown setTitles:@[@"人物", @"爱好", @"其他", @"地区"] radioButtonNidName:@"RadioButton_DropDown"];
    rb_dropdown.delegate = self;
    rb_dropdown.radioButtonType = RadioButtonTypeCanDrop;
    rb_dropdown.tag = 111;
    [self.view addSubview:rb_dropdown];
    
}

- (void)radioButtons:(RadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old{
    
    //radioButtons.tag == 222，则才采用#import "UIView+ShowHisDropDownView.h"（其实际上内部引用了"UIView+ShowPopupInView.h"，刚好与"UIView+PopupInView.h"不同）
    UIView *sender = radioButtons;
    if (index_old != -1) {//notice：此例也有问题，还是得在存在popupView的时候，先隐藏再弹出
        if (index_cur == index_old) {
            [sender showPopupInViewIndependentCode_dismissPopupViewAnimated:YES];
            return;
        }else{
            [sender showPopupInViewIndependentCode_dismissPopupViewAnimated:NO];
        }
    }
    
    switch (index_cur) {
        case 0:
        {
            UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
            popupView.backgroundColor = [UIColor greenColor];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(20, 50, 280, 44)];
            [btn setTitle:@"1.生成随机数，并设置" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [popupView addSubview:btn];
            
            CGFloat h_popupView = 100;
            UIView *popupSuperview = self.view;
            
            
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            [sender showPopupViewIndependentCode:popupView InView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView showComplete:^{
//            [sender showHisDropDownView:popupView inView:popupSuperview withHeight:h_popupView showComplete:^{
                NSLog(@"1.显示完成");
                
            } tapBGComplete:^{
                NSLog(@"1.点击背景完成");
                [radioButtons changeCurrentRadioButtonState];
                [radioButtons setSelectedNone];
                
            } hideComplete:^{
                NSLog(@"1.隐藏完成");
                
            }];
            
            break;
        }
        case 1:
        {
            UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
            popupView.backgroundColor = [UIColor greenColor];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(20, 50, 280, 44)];
            [btn setTitle:@"2.生成随机数，并设置" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [popupView addSubview:btn];
            
            CGFloat h_popupView = 100;
            UIView *popupSuperview = self.view;
            
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            [sender showPopupViewIndependentCode:popupView InView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView showComplete:^{
//            [sender showHisDropDownView:popupView inView:popupSuperview withHeight:h_popupView showComplete:^{
                NSLog(@"2.显示完成");
                
            } tapBGComplete:^{
                NSLog(@"2.点击背景完成");
                [radioButtons changeCurrentRadioButtonState];
                [radioButtons setSelectedNone];
                
            } hideComplete:^{
                NSLog(@"2.隐藏完成");
                
            }];
            break;
        }
        case 2:
        {
            UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
            popupView.backgroundColor = [UIColor greenColor];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(20, 50, 280, 44)];
            [btn setTitle:@"3.生成随机数，并设置" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [popupView addSubview:btn];
            
            CGFloat h_popupView = 100;
            UIView *popupSuperview = self.view;
            
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            [sender showPopupViewIndependentCode:popupView InView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView showComplete:^{
//            [sender showHisDropDownView:popupView inView:popupSuperview withHeight:h_popupView showComplete:^{
                NSLog(@"3.显示完成");
                
            } tapBGComplete:^{
                NSLog(@"3.点击背景完成");
                [radioButtons changeCurrentRadioButtonState];
                [radioButtons setSelectedNone];
                
            } hideComplete:^{
                NSLog(@"3.隐藏完成");
                
            }];
            break;
        }
        case 3:
        {
            UIView *popupView = [[UIView alloc]initWithFrame:CGRectZero];
            popupView.backgroundColor = [UIColor greenColor];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(20, 50, 280, 44)];
            [btn setTitle:@"4.生成随机数，并设置" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [popupView addSubview:btn];
            
            CGFloat h_popupView = 100;
            UIView *popupSuperview = self.view;
            
            CGPoint pointBtnConvert = [sender.superview convertPoint:sender.frame.origin toView:popupSuperview];
            CGPoint pointLocation = CGPointMake(pointBtnConvert.x, pointBtnConvert.y + CGRectGetHeight(sender.frame));
            CGSize size_popupView = CGSizeMake(CGRectGetWidth(sender.frame), h_popupView);
            [sender showPopupViewIndependentCode:popupView InView:popupSuperview atLocationPoint:pointLocation withSize:size_popupView showComplete:^{
//            [sender showHisDropDownView:popupView inView:popupSuperview withHeight:h_popupView showComplete:^{
                NSLog(@"4.显示完成");
                
            } tapBGComplete:^{
                NSLog(@"4.点击背景完成");
                [radioButtons changeCurrentRadioButtonState];
                [radioButtons setSelectedNone];
                
            } hideComplete:^{
                NSLog(@"4.隐藏完成");
                
            }];
            break;
        }
        default:
            break;
    }

}

- (IBAction)btnAction:(id)sender{
    NSString *title = [NSString stringWithFormat:@"%d", rand()%10];
    [rb_dropdown changeCurrentRadioButtonStateAndTitle:title];
    [rb_dropdown setSelectedNone];
    
    [rb_dropdown showPopupInViewIndependentCode_dismissPopupViewAnimated:YES];
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
