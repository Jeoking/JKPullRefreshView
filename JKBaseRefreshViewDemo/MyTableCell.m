

#import "MyTableCell.h"

@implementation MyTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self initViews];
    }
    return (self);
}

- (void)initViews {
    
    [self.contentView addSubview:self.titleLabel];
    
}


#pragma mark - getter

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, 100, 16)];
    _titleLabel.text = @"条码";
    _titleLabel.textColor = [UIColor darkTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    return _titleLabel;
}

@end
