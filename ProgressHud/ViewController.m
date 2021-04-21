//
//  ViewController.m
//  ProgressHud
//
//  Created by gallon on 2019/9/26.
//  Copyright © 2019年 gallon. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+Gallon.h"

@interface ViewController (){
    MBProgressHUD *hud ;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton*showBtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 50, 80, 50)];
    
    [showBtn setBackgroundColor:[UIColor redColor]];
    [showBtn setTitle:@"显示加载" forState:UIControlStateNormal];
    showBtn.titleLabel.textColor=[UIColor whiteColor];
    [showBtn addTarget:self action:@selector(touchShowBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchShowBtn{
    
    hud = [MBProgressHUD showHUDwithMessage:nil];
}



@end
