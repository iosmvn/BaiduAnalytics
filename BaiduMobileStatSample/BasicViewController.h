//
//  BasicViewController.h
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController<UIWebViewDelegate>

@property UIEdgeInsets padding;
@property UIColor *buttonColor;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSString *descDoc;
@property (strong, nonatomic) UIWebView *descView;


- (void)calculateScrollViewContent;
@end
