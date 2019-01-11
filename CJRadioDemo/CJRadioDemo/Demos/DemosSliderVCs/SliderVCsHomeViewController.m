//
//  SliderVCsHomeViewController.m
//  CJRadioDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "SliderVCsHomeViewController.h"
#import "SystemComposeViewController.h"
#import "RadioButtonCycleComposeViewController.h"

@interface SliderVCsHomeViewController () 

@end

@implementation SliderVCsHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"SliderVC首页", nil);
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    
    //SliderVCs
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"SliderVCs相关";
        
        {
            CJModuleModel *sliderVCsModule = [[CJModuleModel alloc] init];
            sliderVCsModule.title = @"RadioButtons + transitionFromViewController";
            sliderVCsModule.classEntry = [SystemComposeViewController class];
            [sectionDataModel.values addObject:sliderVCsModule];
        }
        
        {
            CJModuleModel *sliderVCsModule = [[CJModuleModel alloc] init];
            sliderVCsModule.title = @"RadioButtons + CycleComposeView";
            sliderVCsModule.classEntry = [RadioButtonCycleComposeViewController class];
            sliderVCsModule.isCreateByXib = YES;
            [sectionDataModel.values addObject:sliderVCsModule];
        }

        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
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
