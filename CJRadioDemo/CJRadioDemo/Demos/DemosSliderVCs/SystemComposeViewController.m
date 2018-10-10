//
//  SystemComposeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 14-11-5.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "SystemComposeViewController.h"
#import "TestDataUtil.h"

#import "MySliderRadioButtonsDataSource.h"

@interface SystemComposeViewController () <RadioButtonsDelegate> {
    
}
@property (nonatomic, strong) MySliderRadioButtonsDataSource *sliderRadioButtonsDataSource;

@end

@implementation SystemComposeViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.selectedViewController endAppearanceTransition];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.selectedViewController endAppearanceTransition];
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"RadioButtons + transitionFromViewController", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect navigationBarFrame = self.navigationController.navigationBar.bounds;
    CGFloat navigationBarHeight = CGRectGetHeight(navigationBarFrame);
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = CGRectGetHeight(statusBarFrame);  //20或44
    CGFloat topHeight = navigationBarHeight + statusBarHeight;
    
    NSArray *titles = [TestDataUtil getComponentTitles];
    
    
    //sliderRadioButtonsSample
    CJRadioButtons *sliderRadioButtons = [[CJRadioButtons alloc] init];
    //dataSource
    MySliderRadioButtonsDataSource *sliderRadioButtonsDataSource = [[MySliderRadioButtonsDataSource alloc] init];
    sliderRadioButtonsDataSource.titles = titles;
    sliderRadioButtonsDataSource.defaultSelectedIndex = 0;
    sliderRadioButtonsDataSource.maxButtonShowCount = 5;
    sliderRadioButtons.dataSource = sliderRadioButtonsDataSource;
    //delegate
    sliderRadioButtons.delegate = self;
    [self.view addSubview:sliderRadioButtons];
    [sliderRadioButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(topHeight);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    self.sliderRadioButtons = sliderRadioButtons;
    self.sliderRadioButtonsDataSource = sliderRadioButtonsDataSource;
    
    UIView *composeView = [[UIView alloc] init];
    [self.view addSubview:composeView];
    [composeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sliderRadioButtons.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    self.composeView = composeView;
    
    self.componentViewControllers = [TestDataUtil getComponentViewControllers];
}

#pragma mark - RadioButtonsDataSource & RadioButtonsDelegate
- (void)cj_radioButtons:(CJRadioButtons *)radioButtons chooseIndex:(NSInteger)index_cur oldIndex:(NSInteger)index_old {
    NSLog(@"---------------------");
    [self cj_chooseViewControllerIndex:index_cur oldIndex:index_old completeBlock:^(NSInteger index_cur) {
//        [self doSomethingToCon_whereIndex:index_cur];
    }];
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
