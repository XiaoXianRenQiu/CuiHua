//
//  ViewController.m
//  UserSlider
//
//  Created by 劉鵬飛 on 2017/2/28.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "ViewController.h"
#import "PandorSlider.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    PandorSlider * slider = [[PandorSlider alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 50)];
    [self.view addSubview:slider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
