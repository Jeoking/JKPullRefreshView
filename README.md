# JKPullRefreshView
列表下拉刷新与列表空态页的整合，省去项目中刷新与空态页的冗余代码，自动根据列表数据判断是否显示空态页

__weak typeof(self) weak_self = self;

self.tableView = [[JKBaseRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) customEmptyView:nil refreshBlock:^{

        [weak_self.tableView endRefresh];
        [weak_self.tableView reloadTable:self.listDatas.count];

    } loadMoreBlock:^{

        [weak_self.tableView endLoadMore:LoadMoreNormalTVState];

    }];
