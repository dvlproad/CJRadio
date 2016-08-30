//
//  ViewController.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "ViewController.h"

#import "RBSliderVC.h"

#import "RBDropDownVC.h"
#import "RBDropDownBestVC.h"
#import "RadioButtonsCanDropVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"RadioButtons", nil);
}

- (IBAction)goRBSliderVC:(id)sender {
    RBSliderVC *vc = [[RBSliderVC alloc]initWithNibName:@"RBSliderVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)goRadioButtonsCanDropVC:(id)sender {
    RadioButtonsCanDropVC *vc = [[RadioButtonsCanDropVC alloc]initWithNibName:@"RadioButtonsCanDropVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)goRBDropDownVC:(id)sender {
    RBDropDownVC *vc = [[RBDropDownVC alloc]initWithNibName:@"RBDropDownVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)goRBDropDownBestVC:(id)sender {
    RBDropDownBestVC *vc = [[RBDropDownBestVC alloc]initWithNibName:@"RBDropDownBestVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
