//
//  ViewController.m
//  YZStatusBarHUD
//
//  Created by yz on 16/4/16.
//  Copyright © 2016年 p. All rights reserved.
//

#import "ViewController.h"
#import "YZStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)Success:(id)sender {
    
    [YZStatusBarHUD showSuccess:@"加载成功"];
    
}

- (IBAction)error:(id)sender {
    
    [YZStatusBarHUD showError:@"加载错误"];
    
}

- (IBAction)Loading:(id)sender {
    
    [YZStatusBarHUD showLoading:@"正在加载"];
}

- (IBAction)Hide:(id)sender {
    
    [YZStatusBarHUD hide];
}

@end
