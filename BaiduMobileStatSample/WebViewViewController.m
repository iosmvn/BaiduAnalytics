//
//  WebViewViewController.m
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import "WebViewViewController.h"
#import "BaiduMobStat.h"

@interface WebViewViewController ()<UIWebViewDelegate> {
    UIWebView * demoWebView;
}

@end

@implementation WebViewViewController

- (id)init {
    self = [super init];
    if (self) {
        self.descDoc = @"webview";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WebView统计";
    
    demoWebView = [[UIWebView alloc] initWithFrame:CGRectMake(self.padding.left, self.descView.frame.origin.x + self.descView.frame.size.height + self.padding.top, self.view.frame.size.width - 40, 200)];
    demoWebView.delegate = self;
    [self.scrollView addSubview:demoWebView];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"mobstat" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [demoWebView loadRequest:request];
}
// 实现WebView的代理方法，并在此函数中调用SDK的webviewStartLoadWithRequest:传入request参数，进行统计
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [[BaiduMobStat defaultStat] webviewStartLoadWithRequest:request];
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [super webViewDidFinishLoad:webView];
    if (webView == self.descView) {
        CGRect rect = demoWebView.frame;
        rect.origin.y = webView.frame.origin.y + webView.frame.size.height + self.padding.top;
        demoWebView.frame = rect;
    }
    [self calculateScrollViewContent];
}
@end
