//
//  HeliosCyclesViewController.m
//  HeliosCollectionView
//
//  Created by beyo-zhaoyf on 2017/7/24.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "HeliosCyclesViewController.h"
#import "BaseCollectionViewCell.h"
#import "BaseCyclesLayout.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
@interface HeliosCyclesViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *_imageArray;
}
@end

@implementation HeliosCyclesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupDataSoure];
    [self makeUI];
    // Do any additional setup after loading the view.
}
- (void)setupDataSoure {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 100; i ++) {
        int temp = i%7;
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg",temp];
        [arr addObject:imageName];
    }
    _imageArray = [NSArray arrayWithArray:arr];
}
- (void)makeUI {
    BaseCyclesLayout *layout = [[BaseCyclesLayout alloc]init];
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 300) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.center = self.view.center;
    collectionView.backgroundColor = [UIColor cyanColor];
    [collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
    [self.view addSubview:collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArray.count;
}
/**
 创建cell
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifer = @"BaseCollectionViewCell";
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifer forIndexPath:indexPath];
    cell.imageStr = _imageArray[indexPath.item];
    return cell;
}
/**
 点击某个cell
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
