//
//  JKTableEmptyView.h
//  SaleActivity
//
//  Created by JayKing on 17/3/10.
//  Copyright © 2017年 JayKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKDefaultTableEmptyView : UIView

/**
 初始化
 
 @param frame      frame
 @param emptyImage 空态页图片
 @param emptyTitle 空态页标题
 
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame emptyImage:(UIImage *)emptyImage emptyTitle:(NSString *)emptyTitle;

/**
 空态页图片view
 */
@property (strong, nonatomic) UIImageView *emptyImageView;

/**
 空态页标题
 */
@property (strong, nonatomic) UILabel *emptyLabel;

/**
 空态页副标题
 */
@property (strong, nonatomic) UILabel *emptySubLabel;

/**
 空态页按钮， 默认隐藏
 */
@property (strong, nonatomic) UIButton *emptyButton;

/**
 空态页图片
 */
@property (strong, nonatomic) UIImage *emptyImage;

/**
 空态页标题
 */
@property (strong, nonatomic) NSString *emptyTitle;

/**
 空态页副标题
 */
@property (strong, nonatomic) NSString *emptySubTitle;

/**
 设置图片到标题、标题到按钮 间距
 
 @param titleToButtonSpace 标题到按钮 间距
 @param imageToTitleSpace  图片到标题 间距
 */
//- (void)setSpaceTitleToButton:(NSInteger)titleToButtonSpace ImageToTitle:(NSInteger)imageToTitleSpace;

/**
 空态页双行标题
 */
//- (void)emptyTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
