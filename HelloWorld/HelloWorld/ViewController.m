//
//  ViewController.m
//  HelloWorld
//
//  Created by ShiMac on 15/7/10.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "DotButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
//    UIView *blueView=[[UIView alloc] init];
//    blueView.backgroundColor=[UIColor blueColor];
//    [self.view addSubview:blueView];
//    
//    
//    UIView *greenView=[[UIView alloc] init];
//    greenView.backgroundColor=[UIColor greenColor];
//    [self.view addSubview:greenView];
//    
//    UIView *yellowView=[[UIView alloc] init];
//    yellowView.backgroundColor=[UIColor yellowColor];
//    [self.view addSubview:yellowView];
//    UIView *superView=self.view;
//    
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.equalTo(superView.mas_left).offset(30);
//        make.top.equalTo(superView.mas_top).offset(40);
//        
//        
//        make.right.equalTo(yellowView.mas_left).offset(-50);
//        make.bottom.equalTo(yellowView.mas_top).offset(-30);
//        
//        make.width.equalTo(greenView.mas_width);
//        make.height.equalTo(greenView.mas_height);
//    }];
//    
//    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(blueView.mas_top);
//        make.left.equalTo(blueView.mas_right).offset(50);
//        make.bottom.equalTo(blueView.mas_bottom);
//        
//        make.right.equalTo(superView.mas_right).offset(-30);
//        
//        make.height.equalTo(blueView.mas_height);
//        make.width.equalTo(blueView.mas_width);
//        
//    }];
//
//    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
////        
//        make.left.equalTo(blueView.mas_left);
//        make.right.equalTo(greenView.mas_right);
//        make.top.equalTo(blueView.mas_bottom).offset(30);
//        make.bottom.equalTo(superView.mas_bottom).offset(-30);
//        make.height.equalTo(greenView.mas_height);
////
//        
//        
//    }];
    
    
//    
    DotButton *button=[[DotButton alloc]initWithFrame:CGRectMake(100, 100, 30, 30) withType:HAND_TYPE];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    DotButton *button1=[[DotButton alloc]initWithFrame:CGRectMake(100, 200, 30, 30) withType:FACE_TYPE];
    [button1 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    DotButton *button2=[[DotButton alloc]initWithFrame:CGRectMake(100, 300, 30, 30) withType:SART_TYPE];
    [button2 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    DotButton *button3=[[DotButton alloc]initWithFrame:CGRectMake(100, 400, 30, 30) withType:HEART_TYPE];
    [button3 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    
    
}
-(void)clickAction:(UIButton *)sender
{
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
