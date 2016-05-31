//
//  BasicViewController.m
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (id)init {
    self = [super init];
    if (self) {
        self.padding = UIEdgeInsetsMake(20, 20, 20, 20);
        self.buttonColor = [UIColor colorWithRed:0.2 green:0.592 blue:0.9451 alpha:1];
        self.descDoc = @"basic";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本统计";
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.scrollView];
    
    self.descView = [[UIWebView alloc] initWithFrame:CGRectMake( self.padding.left, self.padding.top, self.view.frame.size.width - 40, 200)];
    [self.descView setDelegate:self];
    
    [self.scrollView addSubview:self.descView];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:self.descDoc ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.descView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    float scrollHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"] floatValue];
    CGRect rect = webView.frame;
    rect.size.height = scrollHeight;
    webView.frame = rect;
    [self calculateScrollViewContent];
    [self.scrollView setNeedsLayout];
}

- (void)calculateScrollViewContent{
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    contentRect.size.height += 20;
    self.scrollView.contentSize = contentRect.size;
}
@end
