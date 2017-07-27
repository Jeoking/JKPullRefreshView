//
//  JKTableEmptyView.m
//  SaleActivity
//
//  Created by JayKing on 17/3/10.
//  Copyright © 2017年 JayKing. All rights reserved.
//

#import "JKDefaultTableEmptyView.h"

#define UIColorFromHexRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//空态页背景色
#define BackGroundColor          UIColorFromHexRGB(0xf2f2f5)
//标题文字颜色
#define EmptyTitleColor          UIColorFromHexRGB(0x666666)
//副标题文字颜色
#define EmptySubTitleColor       UIColorFromHexRGB(0x666666)
//按钮文字颜色
#define EmptyBtnTextColor        UIColorFromHexRGB(0x2eb6aa)
//按钮边框颜色
#define EmptyBtnBorderColor      UIColorFromHexRGB(0x2eb6aa)

//默认空态页图片
static NSString *DefaultEmptyImage = @"manage_meiyou";
//默认标题文字
static NSString *DefaultEmptyTitle = @"暂无数据";
//默认按钮文字
static NSString *DefaultEmptyBtnTitle = @"重新加载";

//标题字体大小
static const CGFloat EmptyTitleSize = 16.0;
//副标题字体大小
static const CGFloat EmptySubTitleSize = 16.0;
//距父控件左右边距
static const CGFloat SpaceTitleToParentView = 50.0;
//标题与副标题的间距
static const CGFloat SpaceTitleToSubTitle = 10.0;
//图片到标题间距
static const CGFloat SpaceImageToTitle = 20.0;
//标题到按钮间距
static const CGFloat SpaceTitleToButton = 20.0;
//按钮字体大小
static const CGFloat EmptyBtnTitleSize = 14.0;
//按钮宽度
static const CGFloat EmptyButtonWidth = 120.0;
//按钮高度
static const CGFloat EmptyButtonHeight = 36.0;
//按钮圆角
static const CGFloat EmptyButtonCornerRadius = 4.0;
//按钮边框宽度
static const CGFloat EmptyButtonBorderWidth = 1.0;
//图片宽度
static const CGFloat EmptyImageWidth = 100.0;


@implementation JKDefaultTableEmptyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = BackGroundColor;

        [self addSubview:self.emptyLabel];
        [self addSubview:self.emptyImageView];
        [self addSubview:self.emptyButton];
        [self addSubview:self.emptySubLabel];
        
        [self initLayout];
        
        [self setEmptyImage:[UIImage imageNamed:DefaultEmptyImage]];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame emptyImage:(UIImage *)emptyImage emptyTitle:(NSString *)emptyTitle {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = BackGroundColor;
        
        [self addSubview:self.emptyLabel];
        [self addSubview:self.emptyImageView];
        [self addSubview:self.emptyButton];
        [self addSubview:self.emptySubLabel];
        
        [self setEmptyImage:emptyImage];
        [self setEmptyTitle:emptyTitle];
        
        [self initLayout];
    }
    return self;
}

- (void)initLayout {
    
    self.emptyButton.frame = CGRectMake(self.frame.size.width/2 - EmptyButtonWidth/2, self.frame.size.height/2 - 44, EmptyButtonWidth, EmptyButtonHeight);
    
    self.emptyLabel.frame = CGRectMake(SpaceTitleToParentView, self.emptyButton.frame.origin.y - EmptyTitleSize - SpaceTitleToButton, self.frame.size.width - SpaceTitleToParentView * 2, EmptyTitleSize);
    
    self.emptyImageView.frame = CGRectMake(self.frame.size.width/2 - EmptyImageWidth/2, self.emptyLabel.frame.origin.y - EmptyImageWidth - SpaceImageToTitle, EmptyImageWidth, EmptyImageWidth);
    
    self.emptySubLabel.frame = CGRectMake(SpaceTitleToParentView, self.emptyLabel.frame.origin.y + EmptyTitleSize + SpaceTitleToSubTitle, self.frame.size.width - SpaceTitleToParentView * 2, EmptyTitleSize);
    //默认隐藏
    self.emptySubLabel.hidden = YES;
}

#pragma setting

//空态页图片
- (UIImageView *)emptyImageView{
    if (!_emptyImageView) {
        _emptyImageView = [[UIImageView alloc] init];
    }
    return _emptyImageView;
}

//空态页文字标题
- (UILabel *)emptyLabel{
    if (!_emptyLabel) {
        _emptyLabel = [[UILabel alloc] init];
        _emptyLabel.textAlignment = NSTextAlignmentCenter;
        _emptyLabel.textColor = EmptyTitleColor;
        _emptyLabel.font = [UIFont systemFontOfSize:EmptyTitleSize];
        _emptyLabel.numberOfLines = 1;
        _emptyLabel.text = DefaultEmptyTitle;
    }
    return _emptyLabel;
}

//空态页文字标题
- (UILabel *)emptySubLabel{
    if (!_emptySubLabel) {
        _emptySubLabel = [[UILabel alloc] init];
        _emptySubLabel.textAlignment = NSTextAlignmentCenter;
        _emptySubLabel.textColor = EmptySubTitleColor;
        _emptySubLabel.font = [UIFont systemFontOfSize:EmptySubTitleSize];
        _emptySubLabel.numberOfLines = 0;
    }
    return _emptySubLabel;
}

//空态页按钮
- (UIButton *)emptyButton {
    if (!_emptyButton) {
        _emptyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _emptyButton.titleLabel.font = [UIFont systemFontOfSize:EmptyBtnTitleSize];
        _emptyButton.backgroundColor = [UIColor clearColor];
        [_emptyButton setTitle:DefaultEmptyBtnTitle forState:UIControlStateNormal];
        _emptyButton.clipsToBounds = YES;
        _emptyButton.layer.cornerRadius = EmptyButtonCornerRadius;
        _emptyButton.layer.borderWidth = EmptyButtonBorderWidth;
        _emptyButton.layer.borderColor = EmptyBtnBorderColor.CGColor;
        [_emptyButton setTitleColor:EmptyBtnTextColor forState:UIControlStateNormal];
        //默认隐藏
        _emptyButton.hidden = YES;
    }
    return _emptyButton;
}

/**
 空态页图片
 */
- (void)setEmptyImage:(UIImage *)emptyImage {
    self.emptyImageView.image = emptyImage;
    //传入图片后重新计算frame，以图片尺寸设置大小
    self.emptyImageView.frame = CGRectMake(self.frame.size.width/2 - EmptyImageWidth/2, self.emptyLabel.frame.origin.y - EmptyImageWidth - SpaceImageToTitle, EmptyImageWidth, EmptyImageWidth);
}

/**
 空态页标题
 */
- (void)setEmptyTitle:(NSString *)emptyTitle {
    self.emptyLabel.text = emptyTitle;
}

/**
 空态页副标题
 */
- (void)setEmptySubTitle:(NSString *)emptySubTitle {
    _emptySubTitle = emptySubTitle;
    self.emptySubLabel.text = emptySubTitle;
    self.emptySubLabel.hidden = NO;
    self.emptyButton.hidden = YES;
    CGSize titleSize = [emptySubTitle boundingRectWithSize:CGSizeMake(self.emptySubLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:EmptyTitleSize]} context:nil].size;
    CGRect titleFrame = self.emptySubLabel.frame;
    titleFrame.size.height = titleSize.height;
    self.emptySubLabel.frame = titleFrame;
}

@end
