//
//  EventViewController.m
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import "EventViewController.h"
#import "BaiduMobStat.h"

@interface EventViewController () {
    BOOL eventState;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
}

@end

@implementation EventViewController

- (id)init {
    self = [super init];
    if (self) {
        self.descDoc = @"event";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义事件统计";
    
    btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"Event1" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setBackgroundColor:self.buttonColor];
    [btn1 setFrame:CGRectMake(self.padding.left, self.descView.frame.origin.y + self.descView.frame.size.height + self.padding.top, self.view.frame.size.width - 40, 50)];
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn1 addTarget:self action:@selector(logEventClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn1];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"Event2 Start" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(self.padding.left, btn1.frame.origin.y + btn1.frame.size.height + self.padding.top,self.view.frame.size.width - 40, 50)];
    btn2.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn2 setBackgroundColor:self.buttonColor];
    [btn2 addTarget:self action:@selector(logEventWithDurationTime:) forControlEvents: UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn2];
    
    btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"Event3 (duration 1s)" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(self.padding.left, btn2.frame.origin.y + btn2.frame.size.height + self.padding.top, self.view.frame.size.width - 40, 50)];
    btn3.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn3 setBackgroundColor:self.buttonColor];
    [btn3 addTarget:self action:@selector(logEventWithOneSeconde:) forControlEvents: UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn3];
}

- (void)logEventClick:(id)sender {
    [[BaiduMobStat defaultStat] logEvent:@"Event1" eventLabel:@"自定义事件一"];
}

- (void)logEventWithDurationTime:(id)sender {
    if(!eventState) {
        eventState = YES;
        [(UIButton*) sender setTitle:@"Event2 End" forState:UIControlStateNormal];
        
        [[BaiduMobStat defaultStat] eventStart:@"Event2" eventLabel:@"自定义事件二"];
    } else {
        eventState = NO;
        [(UIButton*) sender setTitle:@"Event2 Start" forState:UIControlStateNormal];
        
        [[BaiduMobStat defaultStat] eventEnd:@"Event2" eventLabel:@"自定义事件二"];
    }
}

- (void)logEventWithOneSeconde:(id)sender {
    [[BaiduMobStat defaultStat] logEventWithDurationTime:@"Event3" eventLabel:@"自定义事件三" durationTime:1000];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [super webViewDidFinishLoad:webView];
    CGRect rect1 = btn1.frame;
    rect1.origin.y = self.descView.frame.origin.y + self.descView.frame.size.height + self.padding.top;
    btn1.frame = rect1;
    
    CGRect rect2 = btn2.frame;
    rect2.origin.y = btn1.frame.origin.y + btn1.frame.size.height + self.padding.top;
    btn2.frame = rect2;
    
    CGRect rect3 = btn3.frame;
    rect3.origin.y = btn2.frame.origin.y + btn2.frame.size.height + self.padding.top;
    btn3.frame = rect3;
    
    [self calculateScrollViewContent];
}
@end
