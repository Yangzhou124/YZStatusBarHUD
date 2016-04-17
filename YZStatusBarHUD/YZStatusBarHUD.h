//
//  YZStatusBarHUD.h
//  YZStatusBarHUD
//
//  Created by yz on 16/4/16.
//  Copyright © 2016年 p. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZStatusBarHUD : NSObject

+(void)showMessage:(NSString *)message;

+(void)showSuccess:(NSString *)msg;

+(void)showError:(NSString *)msg;

+(void)showLoading:(NSString *)msg;

+(void)showCustomWithImage:(UIImage *)imageName andTitle:(NSString *)title;

+(void)hide;

@end
