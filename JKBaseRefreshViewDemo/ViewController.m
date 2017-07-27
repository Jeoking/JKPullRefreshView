//
//  ViewController.m
//  JKBaseRefreshViewDemo
//
//  Created by JayKing on 17/7/27.
//  Copyright © 2017年 JayKing. All rights reserved.
//

#import "ViewController.h"
#import "JKBaseRefreshTableView.h"
#import "MyTableCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) JKBaseRefreshTableView *tableView;

@property (copy, nonatomic) NSArray *listDatas;

@end

@implementation ViewController {
    NSArray *_cacheArray;
    BOOL _noData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表刷新及空态页显隐";
    
    _cacheArray = @[@"你好_1",@"你好_2",@"你好_3",@"你好_4",@"你好_5",@"你好_6",@"你好_7",@"你好_8",@"你好_9",@"你好_10",@"你好_11",@"你好_12",@"你好_13",@"你好_14",@"你好_15",@"你好_16",@"你好_17",@"你好_18",@"你好_19",@"你好_20",];
    
    self.listDatas = _cacheArray;
    
    __weak typeof(self) weak_self = self;
    self.tableView = [[JKBaseRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) customEmptyView:nil refreshBlock:^{
        [weak_self.tableView endRefresh];
        self.listDatas = _noData ? _cacheArray : nil;
        _noData = !_noData;
        [weak_self.tableView reloadTable:self.listDatas.count];
    } loadMoreBlock:^{
        [weak_self.tableView endLoadMore:LoadMoreNormalTVState];
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setAllowsSelection:NO];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[MyTableCell class] forCellReuseIdentifier:@"MyTableCellID"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

/**
 *  @brief  返回行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

#pragma mark - UITableViewDataSource
/**
 *  @brief  每一个区固定只返回一行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listDatas.count;
}

/**
 *  @brief  cell加载
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableCellID"];
    
    cell.titleLabel.text = self.listDatas[indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
