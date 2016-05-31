//
//  ExceptionViewController.m
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import "ExceptionViewController.h"

@interface ExceptionViewController () {
    UIButton *btn;
}

@end

@implementation ExceptionViewController


- (id)init {
    self = [super init];
    if (self) {
        self.descDoc = @"exception";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"错误统计";
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"触发异常" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(self.padding.left, self.descView.frame.origin.y + self.descView.frame.size.height + self.padding.top, self.view.frame.size.width - 40, 50)];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn setBackgroundColor:self.buttonColor];
    [btn addTarget:self action:@selector(makeException:) forControlEvents: UIControlEventTouchUpInside];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.scrollView addSubview:btn];
}

- (void)makeException:(id)sender {
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"1", nil];
    [array1 objectAtIndex:2];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [super webViewDidFinishLoad:webView];
    CGRect rect = btn.frame;
    rect.origin.y = self.descView.frame.origin.y + self.descView.frame.size.height + self.padding.top;
    btn.frame = rect;
    [self calculateScrollViewContent];
}
@end
