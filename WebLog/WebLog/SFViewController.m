//
//  SFViewController.m
//  WebLog
//
//  Created by 劉鵬飛 on 2017/3/28.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SFSafariViewController *safariViewContro = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://192.168.0.65/doc/page/login.asp?_1490664605590"]];
    
    safariViewContro.delegate = self;
    [self presentViewController:safariViewContro animated:NO completion:^{
       
        NSLog(@"------");
    }];
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller{

    [controller dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{


    NSLog(@"请求完成");
}


- (NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller activityItemsForURL:(NSURL *)URL title:(nullable NSString *)title{


    return [NSArray array];
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
