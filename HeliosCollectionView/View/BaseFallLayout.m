//
//  BaseFallLayout.m
//  HeliosCollectionView
//
//  Created by beyo-zhaoyf on 2017/7/24.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "BaseFallLayout.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kLineNum 3
#define kLineSpacing 10
@interface BaseFallLayout ()
{
    UIEdgeInsets _edgeInset;//内边距
    CGFloat _lineSpacing;//行边距
    CGFloat _columnsSpaceing;//列边距
    NSInteger _columnsNum; //列数
    NSMutableArray *_columnsHeightArray;
    CGFloat _maxHeight;//collectionContent最大高度
}
/*
 ** 存放cell的布局
 */
@property (nonatomic,strong)NSMutableArray *attributesArray;
@end
@implementation BaseFallLayout
- (instancetype )init {
    if(self = [super init]){
        _columnsHeightArray = [NSMutableArray new];
        _columnsHeightArray = [NSMutableArray arrayWithCapacity:_columnsNum];
    }
    return self;
}
/*
 ** prepareLayout 会平凡调用 只做简单的初始化操作
 */
- (void)prepareLayout {
    [super prepareLayout];
    _edgeInset = UIEdgeInsetsMake(5, 10, 5, 10);
    _lineSpacing = 10;
    _columnsSpaceing = 10;
    _columnsNum = 3;
    _maxHeight = _edgeInset.top;
    [_columnsHeightArray removeAllObjects];
    for (int i = 0;i <_columnsNum ; i++) {
        [_columnsHeightArray addObject:[NSNumber numberWithInteger:_edgeInset.top]];
    }
    [self.attributesArray removeAllObjects];
    
}
/*
 ** 设置为YES,collectionView的显示范围发生变化时，就要刷新布局
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger cellNum = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0 ; i < cellNum; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArray addObject:attribute];
    }
    return self.attributesArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute  = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat cellWeight = (kScreenWidth - _edgeInset.left -_edgeInset.right-(_columnsNum-1)*_columnsSpaceing)/_columnsNum;
    CGFloat cellHeight = indexPath.item%10 == 0?200:(indexPath.item%2==0?125:160);
     // 应该添加cell的列号
    NSInteger minHeightColumn = 0;
    //添加cell的列高度
    CGFloat minColumHeight = [_columnsHeightArray[minHeightColumn] doubleValue];
    
    for (int i = 0; i<_columnsHeightArray.count; i++) {
        CGFloat tempH = [_columnsHeightArray[i] floatValue];
        if (minColumHeight > tempH) {
            minColumHeight = tempH;
            minHeightColumn = i;
        }
    }
    //为高度最小的列添加cell
    CGFloat cellY = [_columnsHeightArray[minHeightColumn] floatValue]+_lineSpacing;
    CGFloat cellX = _edgeInset.left + minHeightColumn * (cellWeight + _columnsSpaceing);
    attribute.frame = CGRectMake(cellX, cellY, cellWeight, cellHeight);
    //保存最新的高度
    CGFloat newHeight = cellY+cellHeight;
    [_columnsHeightArray replaceObjectAtIndex:minHeightColumn withObject:[NSNumber numberWithInteger:newHeight]];
    //返回布局信息
    return attribute;
}
- (CGSize)collectionViewContentSize {
    //根据最高的列 设置collectionContentSize
    [_columnsHeightArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat maxHeight = [_columnsHeightArray[idx]floatValue];
        if (maxHeight > _maxHeight) {
            _maxHeight = maxHeight;
        }
    }];
    return CGSizeMake(kScreenWidth, _maxHeight);
}
- (NSMutableArray *)attributesArray {
    if(!_attributesArray){
        _attributesArray = [NSMutableArray new];
    }
    return _attributesArray;
}













@end
