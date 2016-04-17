//
//  YZStatusBarHUD.m
//  YZStatusBarHUD
//
//  Created by yz on 16/4/16.
//  Copyright © 2016年 p. All rights reserved.
//

#define YZMsgFont  [UIFont systemFontOfSize:13.0]
//消息停留在屏幕上的时间
#define YZMessageDuration 2.0
#define YZMShowAnimation 0.25
#import "YZStatusBarHUD.h"
#import <UIKit/UIKit.h>

@implementation YZStatusBarHUD

static UIWindow *window_;
static NSTimer *time_;

+(void)CreateWindow
{
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame =frame;
    frame.origin.y = 0;
    [UIView animateWithDuration:YZMShowAnimation animations:^{
        
        window_.frame = frame;
        
    }];
    window_.hidden = NO;
}

/**
 * 显示文本信息
 */
+(void)showMessage:(NSString *)message
{
    [self showCustomWithImage:nil andTitle:message];
}
/**
 * 显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    [self showCustomWithImage:[UIImage imageNamed:@"YZStatusBarHUD.bundle/check"] andTitle:msg];
}

/**
 * 显示失败信息
 */
+(void)showError:(NSString *)msg
{
    [self showCustomWithImage:[UIImage imageNamed:@"YZStatusBarHUD.bundle/error"] andTitle:msg];
}

/**
 * 显示正在处理的信息
 */
+(void)showLoading:(NSString *)msg
{
    [time_ invalidate];
    time_ = nil;
    [self CreateWindow];
    UILabel *label = [[UILabel alloc]init];
    label.font = YZMsgFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : YZMsgFont}].width;
    CGFloat msgCenterY = window_.bounds.size.height * 0.5;
    CGFloat msgCenterX = (window_.bounds.size.width - msgW)*0.5 - 20;
    loadView.center = CGPointMake(msgCenterX, msgCenterY);
    [loadView startAnimating];
    [window_ addSubview:loadView];
}

/**
 *自定义信息(图片传NSString)
 */
+(void)showCustomWithImage:(UIImage *)imageName andTitle:(NSString *)title
{
 
    //停止定时器
    [time_ invalidate];

    
    //显示window
    [self CreateWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = YZMsgFont;
    if (imageName) {
        [button setImage:imageName forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时器
    time_ = [NSTimer scheduledTimerWithTimeInterval:YZMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];

}

/**
 * 隐藏
 */
+(void)hide
{
    [UIView animateWithDuration:YZMShowAnimation animations:^{
       
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
        
        
    }completion:^(BOOL finished) {
        window_ = nil;
    }];
    
//    window_ = nil;

}

@end
