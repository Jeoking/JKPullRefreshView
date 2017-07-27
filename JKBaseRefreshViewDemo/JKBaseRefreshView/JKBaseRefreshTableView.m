//
//  MyRefreshTableView.m
//
//  Created by JayKing on 17/9/10.
//  Copyright (c) 2017年 king. All rights reserved.
//

#import "JKBaseRefreshTableView.h"
#import "JKDefaultTableEmptyView.h"
#import "MJRefresh.h"


@implementation JKBaseRefreshTableView

- (void)dealloc{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame customEmptyView:(UIView *)customEmptyView refreshBlock:(PullRefreshBlock)refreshBlock loadMoreBlock:(LoadMoreBlock)loadMoreBlock {
    self = [super initWithFrame:frame];
    if (self) {
        _refreshBlock = refreshBlock;
        _loadMoreBlock = loadMoreBlock;
        __weak typeof(self) weak_self = self;
        if (self.refreshBlock) {
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                weak_self.refreshBlock();
            }];
        }
        
        if (self.loadMoreBlock) {
            self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                weak_self.loadMoreBlock();
            }];
            self.mj_footer.automaticallyHidden = YES;
        }
        
        if (customEmptyView) {
            self.emptyView = customEmptyView;
            self.emptyView.frame = self.bounds;
        } else {
            self.emptyView = [[JKDefaultTableEmptyView alloc] initWithFrame:self.bounds];
        }
        [self addSubview:self.emptyView];
        self.emptyView.hidden = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle customEmptyView:(UIView *)customEmptyView refreshBlock:(PullRefreshBlock)refreshBlock loadMoreBlock:(LoadMoreBlock)loadMoreBlock {
    self = [super initWithFrame:frame style:tableViewStyle];
    if (self) {
        _refreshBlock = refreshBlock;
        _loadMoreBlock = loadMoreBlock;
        __weak typeof(self) weak_self = self;
        if (self.refreshBlock) {
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                weak_self.refreshBlock();
            }];
        }
        
        if (self.loadMoreBlock) {
            self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                weak_self.loadMoreBlock();
            }];
            self.mj_footer.automaticallyHidden = YES;
        }
        
        if (customEmptyView) {
            self.emptyView = customEmptyView;
            self.emptyView.frame = self.bounds;
        } else {
            self.emptyView = [[JKDefaultTableEmptyView alloc] initWithFrame:self.bounds];
        }
        [self addSubview:self.emptyView];
        self.emptyView.hidden = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle  customEmptyView:(UIView *)customEmptyView {
    self = [super initWithFrame:frame style:tableViewStyle];
    if (self) {
        if (customEmptyView) {
            self.emptyView = customEmptyView;
            self.emptyView.frame = self.bounds;
        } else {
            self.emptyView = [[JKDefaultTableEmptyView alloc] initWithFrame:self.bounds];
        }
        [self addSubview:self.emptyView];
        self.emptyView.hidden = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame customEmptyView:(UIView *)customEmptyView {
    self = [super initWithFrame:frame];
    if (self) {
        if (customEmptyView) {
            self.emptyView = customEmptyView;
            self.emptyView.frame = self.bounds;
        } else {
            self.emptyView = [[JKDefaultTableEmptyView alloc] initWithFrame:self.bounds];
        }
        [self addSubview:self.emptyView];
        self.emptyView.hidden = YES;
    }
    return self;
}

#pragma mark - getter

- (UIButton *)emptyButton {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        return tableEmptyView.emptyButton;
    }
    return nil;
}

#pragma mark - setter

- (void)setRefreshBlock:(PullRefreshBlock)pullRefreshBlock {
    _refreshBlock = pullRefreshBlock;
    if (_refreshBlock) {
        __weak typeof(self) weak_self = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weak_self.refreshBlock();
        }];
    } else {
        self.mj_header = nil;
    }
}

- (void)setLoadMoreBlock:(LoadMoreBlock)loadMoreBlock {
    _loadMoreBlock = loadMoreBlock;
    if (_loadMoreBlock) {
        __weak typeof(self) weak_self = self;
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            weak_self.loadMoreBlock();
        }];
        self.mj_footer.automaticallyHidden = YES;
    }else {
        self.mj_footer = nil;
    }
}

- (void)setEmptyImage:(UIImage *)img {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        if (img) {
            tableEmptyView.emptyImage = img;
        }
    }
}

- (void)setEmptyTitle:(NSString *)title {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        if (title) {
            tableEmptyView.emptyTitle = title;
        }
    }
}

- (void)setEmptySubTitle:(NSString *)subTitle {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        if (subTitle) {
            tableEmptyView.emptySubTitle = subTitle;
        }
    }
}

- (void)setEmptyButtonTitle:(NSString *)title {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        if (title) {
            [tableEmptyView.emptyButton setTitle:title forState:UIControlStateNormal];
        }
    }
}

- (void)setShowEmptyButton:(BOOL)isShow {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        tableEmptyView.emptyButton.hidden = !isShow;
        if (isShow) {
            tableEmptyView.emptySubLabel.hidden = YES;
            [tableEmptyView.emptyButton addTarget:self action:@selector(emptyBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - action

- (void)emptyBtnClickAction {
    if (self.emptyButtonClickBlock) {
        self.emptyButtonClickBlock();
    } else {
        [self startRefresh];
    }
}

- (void)setEmptyButtonClickBlock:(EmptyButtonClickBlock)emptyButtonClickBlock {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        if (emptyButtonClickBlock) {
            _emptyButtonClickBlock = emptyButtonClickBlock;
            [tableEmptyView.emptyButton addTarget:self action:@selector(emptyBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - method

- (void)jkDefaultEmptyButton:(NSString *)title clickBlock:(EmptyButtonClickBlock)emptyButtonClickBlock {
    if (_emptyView && [_emptyView isKindOfClass:[JKDefaultTableEmptyView class]]) {
        JKDefaultTableEmptyView *tableEmptyView = (JKDefaultTableEmptyView *)_emptyView;
        _emptyButtonClickBlock = emptyButtonClickBlock;
        if (emptyButtonClickBlock) {
            [tableEmptyView.emptyButton addTarget:self action:@selector(emptyBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        }
        if (title) {
            [tableEmptyView.emptyButton setTitle:title forState:UIControlStateNormal];
        }
    }
}

- (void)disableRefreshHeader {
    self.mj_header = nil;
    self.refreshBlock = nil;
}

- (void)disableLoadMoreFooter {
    self.mj_footer = nil;
    self.loadMoreBlock = nil;
}

- (void)reloadTable:(NSInteger)count{
    [self reloadData];
    if (count > 0) {
        self.emptyView.hidden = YES;
    } else {
        self.emptyView.hidden = NO;
    }
}

- (void)showOrHideEmptyView:(BOOL)hideEmptyView {
    self.emptyView.hidden = hideEmptyView;
}

- (void)startRefresh {
    [self.mj_header beginRefreshing];
}

- (void)endRefresh {
    [self.mj_header endRefreshing];
    [(MJRefreshAutoNormalFooter *)self.mj_footer resetNoMoreData];
}

- (void)startLoadMore {
    [self.mj_footer beginRefreshing];
}

- (void)endLoadMore:(TableViewLoadMoreState)state {
    [self.mj_footer endRefreshing];
    switch (state) {
        case LoadMoreNoDataTVState:
            [(MJRefreshAutoNormalFooter *)self.mj_footer endRefreshingWithNoMoreData];
            break;
        case LoadMoreNormalTVState:
            [(MJRefreshAutoNormalFooter *)self.mj_footer resetNoMoreData];
            break;
            
        default:
            break;
    }
    
}

@end
