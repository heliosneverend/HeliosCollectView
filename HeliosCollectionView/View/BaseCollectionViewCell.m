//
//  BaseCollectionViewCell.m
//  HeliosCollectionView
//
//  Created by beyo-zhaoyf on 2017/7/24.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "BaseCollectionViewCell.h"
@interface BaseCollectionViewCell ()
@property (nonatomic,strong) UIImageView *imageView;
@end
@implementation BaseCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self makeUI];
    }
    return self;
}
- (void)makeUI {
     self.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    self.imageView = imageView;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
- (void)setImageStr:(NSString *)imageStr {
    _imageStr = imageStr;
    self.imageView.image = [UIImage imageNamed:_imageStr];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
@end
