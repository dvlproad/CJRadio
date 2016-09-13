//
//  ViewController.m
//  RadioControllersDemo
//
//  Created by 李超前 on 16/8/26.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "ViewController.h"
#import "RadioControllersViewController.h"
#import "Home1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
