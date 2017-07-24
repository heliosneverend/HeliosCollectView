//
//  HeliosFallViewController.m
//  HeliosCollectionView
//
//  Created by beyo-zhaoyf on 2017/7/24.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "HeliosFallViewController.h"
#import "BaseCollectionViewCell.h"
#import "BaseFallLayout.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface HeliosFallViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_imagesArray;
}
@end

@implementation HeliosFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    [self setDataSource];
    [self makeUI];
}
- (void)setDataSource {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 100; i ++) {
        int temp = i%7;
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg",temp];
        [arr addObject:imageName];
    }
    
    _imagesArray = [NSArray arrayWithArray:arr];
}
- (void)makeUI {
    BaseFallLayout *layout = [[BaseFallLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
     [collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
}
#pragma mark delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imagesArray.count;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifer = @"BaseCollectionViewCell";
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifer forIndexPath:indexPath];
    cell.imageStr = _imagesArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
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
