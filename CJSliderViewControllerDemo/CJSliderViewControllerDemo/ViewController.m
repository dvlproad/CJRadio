//
//  ViewController.m
//  CJSliderViewControllerDemo
//
//  Created by lichq on 14-11-5.
//  Copyright (c) 2014年 lichq. All rights reserved.
//

#import "ViewController.h"
#import "CJSliderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"首页", nil);
}
- (IBAction)goCJSliderViewController:(id)sender {
    CJSliderViewController *viewCotroller = [[CJSliderViewController alloc] initWithNibName:@"CJSliderViewController" bundle:nil];
    [self.navigationController pushViewController:viewCotroller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
