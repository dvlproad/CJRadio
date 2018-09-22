//
//  CustomButtonViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 15/11/11.
//  Copyright (c) 2015年 dvlproad. All rights reserved.
//

#import "CustomButtonViewController.h"

@interface CustomButtonViewController ()

@end

@implementation CustomButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"自定义Button", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"arrowRight_red"];
    self.myImageBottomButton.imagePosition = MyButtonImagePositionRight;
    self.myImageBottomButton.backgroundColor = [UIColor lightGrayColor];
    [self.myImageBottomButton setImage:image forState:UIControlStateNormal];
    [self.myImageBottomButton setTitle:@"图片在下的button" forState:UIControlStateNormal];
    
    
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
