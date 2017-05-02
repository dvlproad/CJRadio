//
//  ViewController.m
//  CJRadioDemo
//
//  Created by lichq on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "ViewController.h"

#import "RBSliderVC.h"
#import "RBDropDownVC.h"

#import "RadioControllersViewController.h"
#import "Home1.h"

#import "SliderViewController.h"
#import "SliderViewController2.h"
#import "SystemComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"CJRadioButtons", nil);
}

- (IBAction)goRBSliderVC:(id)sender {
    RBSliderVC *vc = [[RBSliderVC alloc]initWithNibName:@"RBSliderVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)goRBDropDownVC:(id)sender {
    RBDropDownVC *vc = [[RBDropDownVC alloc]initWithNibName:@"RBDropDownVC" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}



- (IBAction)goRadioControllersViewController:(id)sender {
    RadioControllersViewController *viewController = [[RadioControllersViewController alloc] initWithNibName:@"RadioControllersViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goHome1:(id)sender {
    Home1 *home3 = [[Home1 alloc] initWithNibName:@"Home1" bundle:nil];
    home3.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:home3 animated:YES];
}




- (IBAction)goSliderViewController:(id)sender {
    SliderViewController *viewController = [[SliderViewController alloc] initWithNibName:@"SliderViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goSliderViewController2:(id)sender {
    SliderViewController2 *viewController = [[SliderViewController2 alloc] initWithNibName:@"SliderViewController2" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goSystemComposeViewController:(id)sender {
    SystemComposeViewController *viewController = [[SystemComposeViewController alloc] initWithNibName:@"SystemComposeViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
