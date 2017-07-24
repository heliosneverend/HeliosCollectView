//
//  ViewController.m
//  HeliosCollectionView
//
//  Created by beyo-zhaoyf on 2017/7/24.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "ViewController.h"
#import "HeliosFallViewController.h"
#import "HeliosCyclesViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    button.tag = 2001;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"瀑布流" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonsed = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 100, 50)];
    buttonsed.backgroundColor = [UIColor blueColor];
    [self.view addSubview:buttonsed];
    buttonsed.tag = 2002;
    [buttonsed setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsed setTitle:@"缩放轮播图" forState:UIControlStateNormal];
     [buttonsed addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    if(button.tag == 2001){
        HeliosFallViewController *HVC = [[HeliosFallViewController alloc]init];
        [self.navigationController pushViewController:HVC animated:YES];
    }else{
        HeliosCyclesViewController *HVC = [[HeliosCyclesViewController alloc]init];
        [self.navigationController pushViewController:HVC animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
