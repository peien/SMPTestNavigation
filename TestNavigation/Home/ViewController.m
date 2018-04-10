//
//  ViewController.m
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIBarButtonItem *rightNextItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(rightNext)];
//    self.navigationItem.rightBarButtonItem = rightNextItem;
//
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, .1)];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark - actions
- (void)rightNext {
    ViewController *vc = [[ViewController alloc] init];
//    vc.barModel.navBarImageBgColor = [UIColor orangeColor];
//    vc.barModel.navBarTintColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"普通push";
        
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"color push";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"隐藏导航栏 push";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        ViewController *vc = [[ViewController alloc] init];
        vc.navBgColor = [UIColor redColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        ViewController *vc = [[ViewController alloc] init];
        vc.hiddenNavBg = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
