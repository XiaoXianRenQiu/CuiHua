//
//  TodayViewController.m
//  WidGet
//
//  Created by 劉鵬飛 on 2017/3/27.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#define RGB(r, g, b)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define RGBAarc4andom RGB(arc4random()%255, arc4random()%255, arc4random()%255)

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.preferredContentSize = CGSizeMake(0, 500);
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = RGBAarc4andom;
    button.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonAction:(UIButton *)sender{

    sender.backgroundColor = RGBAarc4andom;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{

    
    return UIEdgeInsetsZero;

}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{


    //宽度是固定的
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        //收起模式
        self.preferredContentSize = CGSizeMake(0, 110);
        
    }else if (activeDisplayMode == NCWidgetDisplayModeExpanded){
    
        //展开模式
        self.preferredContentSize = CGSizeMake(0, 310);
    }

}

@end
