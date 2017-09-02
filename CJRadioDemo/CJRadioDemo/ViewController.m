//
//  ViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "ViewController.h"

#import "Home1.h"
#import "CustomButtonViewController.h"

#import "MySliderRadioButtonsDataSourceViewController.h"
#import "MyRadioButtonsPopupSampleViewController.h"

#import "CycleComposeViewController.h"

#import "SliderViewController.h"
#import "RadioButtonCycleComposeViewController.h"
#import "SystemComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"CJRadioButtons", nil);
}


- (IBAction)goHome1:(id)sender {
    Home1 *viewController = [[Home1 alloc] initWithNibName:@"Home1" bundle:nil];
    viewController.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goCustomButtonViewController:(id)sender {
    CustomButtonViewController *viewController = [[CustomButtonViewController alloc] initWithNibName:@"CustomButtonViewController" bundle:nil];
    viewController.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:viewController animated:YES];
}



- (IBAction)goMySliderRadioButtonsDataSourceViewController:(id)sender {
    MySliderRadioButtonsDataSourceViewController *vc = [[MySliderRadioButtonsDataSourceViewController alloc]initWithNibName:@"MySliderRadioButtonsDataSourceViewController" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)goMyRadioButtonsPopupSampleViewController:(id)sender {
    MyRadioButtonsPopupSampleViewController *vc = [[MyRadioButtonsPopupSampleViewController alloc]initWithNibName:@"MyRadioButtonsPopupSampleViewController" bundle:nil];
    vc.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:vc animated:YES];
}



- (IBAction)goRadioControllersViewController:(id)sender {
    CycleComposeViewController *viewController = [[CycleComposeViewController alloc] initWithNibName:@"CycleComposeViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}



- (IBAction)goSliderViewController:(id)sender {
    SliderViewController *viewController = [[SliderViewController alloc] initWithNibName:@"SliderViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goSliderViewController2:(id)sender {
    RadioButtonCycleComposeViewController *viewController = [[RadioButtonCycleComposeViewController alloc] initWithNibName:@"RadioButtonCycleComposeViewController" bundle:nil];
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
