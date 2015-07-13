//
//  ViewController.m
//  HelloWorld
//
//  Created by ShiMac on 15/7/10.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *sv = [UIView new];
    sv.backgroundColor=[UIColor brownColor];
    
    //在做autoLayout之前 一定要先将view添加到superview上 否则会报错
    [self.view addSubview:sv];
    //mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //将sv居中(很容易理解吧?)
        make.center.equalTo(self.view);
        
        //将size设置成(300,300)
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
