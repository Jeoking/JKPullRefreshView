//
//  MyRefreshTableView.h
//  DaciMusic
//
//  Created by JK on 15/9/10.
//  Copyright (c) 2015年 daci. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EmptyButtonClickBlock)(void);

typedef NS_ENUM(NSUInteger, CollectionViewLoadMoreState) {
    //还有数据加载的状态
    LoadMoreNormalCVState,
    //无数据可加载的状态
    LoadMoreNoDataCVState,
};
typedef void(^PullRefreshBlock)();
typedef void(^LoadMoreBlock)();

/**
 上拉下拉和空态页集成的JKBaseRefreshCollectionView
 */
@interface JKBaseRefreshCollectionView : UICollectionView

/**
 空态view
 */
@property (nonatomic, strong) UIView *emptyView;

/**
 空态页按钮点击回调block
 */
@property (nonatomic, strong) EmptyButtonClickBlock emptyButtonClickBlock;

/**
 下拉刷新回调block
 */
@property (nonatomic, copy) PullRefreshBlock refreshBlock;

/**
 上拉加载回调block
 */
@property (nonatomic, copy) LoadMoreBlock loadMoreBlock;

/**
 是否显示空态页按钮
 */
@property (assign, nonatomic) BOOL showEmptyButton;

/**
 设置空态页按钮标题
 */
@property (strong, nonatomic) NSString *emptyButtonTitle;

/**
 设置空态页图片
 */
@property (strong, nonatomic) UIImage *emptyImage;

/**
 设置空态页标题
 */
@property (strong, nonatomic) NSString *emptyTitle;

/**
 设置空态页副标题
 */
@property (strong, nonatomic) NSString *emptySubTitle;

/**
 设置空态页按钮
 */
@property (strong, nonatomic) UIButton *emptyButton;

/**
 初始化
 
 @param frame               frame
 @param customEmptyView     自定义空态view，若为空则选择默认空态页
 @param refreshBlock        下拉刷新回调，若为空则下拉无效
 @param loadMoreBlock       上拉加载回调，若为空则上拉无效
 
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame customEmptyView:(UIView *)customEmptyView collectionViewLayout:(UICollectionViewLayout *)layout refreshBlock:(PullRefreshBlock)refreshBlock loadMoreBlock:(LoadMoreBlock)loadMoreBlock;

/**
 初始化
 
 @param frame               frame
 @param customEmptyView     自定义空态view，若为空则选择默认空态页
 
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout customEmptyView:(UIView *)customEmptyView;

/**
 设置空态页按钮
 
 @param emptyButtonClickBlock 回调block，默认隐藏
 */
- (void)jkDefaultEmptyButton:(NSString *)title clickBlock:(EmptyButtonClickBlock)emptyButtonClickBlock;


/**
 使下拉刷新无效
 */
- (void)disableRefreshHeader;

/**
 使上拉加载无效
 */
- (void)disableLoadMoreFooter;

/**
 重刷新tableview，传入count为0则显示空态页
 */
- (void)reloadTable:(NSInteger)count;

/**
 开始刷新操作
 */
- (void)startRefresh;

/**
 结束刷新，传入count为0则显示空态页
 */
- (void)endRefresh;

/**
 开始上拉加载操作
 */
- (void)startLoadMore;

/**
 结束上拉加载，传入加载状态
 */
- (void)endLoadMore:(CollectionViewLoadMoreState)state;

/**
 隐藏或显示空态页
 */
- (void)showOrHideEmptyView:(BOOL)hideEmptyView;

@end
