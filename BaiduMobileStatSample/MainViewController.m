//
//  MainViewController.m
//  BaiduMobileStatSample
//
//  Created by Rurui Ye on 4/6/16.
//  Copyright © 2016 com.baidu.hmtj. All rights reserved.
//

#import "MainViewController.h"
#import "BasicViewController.h"
#import "EventViewController.h"
#import "PageViewController.h"
#import "WebViewViewController.h"
#import "ExceptionViewController.h"

@interface MainViewController (){
    NSArray *dataSource;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = @[@"基本统计", @"自定义事件统计", @"Web View统计", @"页面统计", @"错误统计"];
    self.title = @"百度移动统计";
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.textLabel.text = dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            UIViewController *basicViewController = [[BasicViewController alloc] init];
            [self.navigationController pushViewController:basicViewController animated:TRUE];
            break;
        }
        case 1: {
            UIViewController *eventViewController = [[EventViewController alloc] init];
            [self.navigationController pushViewController:eventViewController animated:TRUE];
            break;
        }
        case 2: {
            UIViewController *webViewViewController = [[WebViewViewController alloc] init];
            [self.navigationController pushViewController:webViewViewController animated:TRUE];
            break;
        }
        case 3: {
            UIViewController *pageViewController = [[PageViewController alloc] init];
            [self.navigationController pushViewController:pageViewController animated:TRUE];
            break;
        }
        case 4: {
            UIViewController *exceptionViewController = [[ExceptionViewController alloc] init];
            [self.navigationController pushViewController:exceptionViewController animated:TRUE];
            break;
        }
        default:
            break;
    }
}
@end
