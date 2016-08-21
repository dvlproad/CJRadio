//
//  ViewController.m
//  RadioButtonsDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "ViewController.h"
#import "RBBaseVC.h"
#import "RBDropDownVC.h"
#import "RBDropDownBestVC.h"
#import "RBSliderVC.h"
#import "RadioButtonsCanDropVC.h"

#import "RadioButtonsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"RadioButtons", nil);
}

- (IBAction)goRadioButtonsCanDropVC:(id)sender{
    RadioButtonsCanDropVC *vc = [[RadioButtonsCanDropVC alloc]initWithNibName:@"RadioButtonsCanDropVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRBBseVC:(id)sender{
    RBBaseVC *vc = [[RBBaseVC alloc]initWithNibName:@"RBBaseVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRBDropDownVC:(id)sender{
    RBDropDownVC *vc = [[RBDropDownVC alloc]initWithNibName:@"RBDropDownVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRBDropDownBestVC:(id)sender{
    RBDropDownBestVC *vc = [[RBDropDownBestVC alloc]initWithNibName:@"RBDropDownBestVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRBSliderVC:(id)sender{
    RBSliderVC *vc = [[RBSliderVC alloc]initWithNibName:@"RBSliderVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRadioButtonsViewController:(id)sender {
    RadioButtonsViewController *viewController = [[RadioButtonsViewController alloc]initWithNibName:@"RadioButtonsViewController" bundle:nil];
    viewController.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
