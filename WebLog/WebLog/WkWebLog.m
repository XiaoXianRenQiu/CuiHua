//
//  WkWebLog.m
//  WebLog
//
//  Created by 劉鵬飛 on 2017/3/28.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "WkWebLog.h"
@implementation WkWebLog{

    WKWebView *webView;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatWKWebView];
    }
    return self;
}

- (void)creatWKWebView{

    webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.65/doc/page/login.asp?_1490664605590"]];
    [webView loadRequest:request];
    [self addSubview:webView];
}


#pragma mark -WKNavigationDelegate

//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

    NSLog(@"页面开始加载");

}

//页面开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{


    NSLog(@"页面开始返回");
    
}

//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{


    NSLog(@"页面加载完成");


}


//页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{

    NSLog(@"页面加载失败");

}


//链接到服务器跳转请求后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{

}


//收到响应后决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

    NSLog(@"%@",navigationAction.request.URL.absoluteString);

    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    
    
    //不允许跳转
//    decisionHandler(WKNavigationActionPolicyCancel);
}


#pragma mark -WKUIDelegate

//创建一个新的webView
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{

    return [[WKWebView alloc] init];

}

//输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{

    

}

//确认框
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{


}

//警告框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{


    
}



@end
