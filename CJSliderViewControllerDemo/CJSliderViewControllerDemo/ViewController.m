//
//  ViewController.m
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "ViewController.h"
#import "SliderViewController.h"
#import "SliderViewController2.h"
#import "SystemComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = NSLocalizedString(@"首页", nil);
}

- (IBAction)goSliderViewController:(id)sender {
    SliderViewController *viewController = [[SliderViewController alloc]initWithNibName:@"SliderViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goSliderViewController2:(id)sender {
    SliderViewController2 *viewController = [[SliderViewController2 alloc]initWithNibName:@"SliderViewController2" bundle:nil];
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
