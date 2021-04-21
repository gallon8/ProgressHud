//
//  MBProgressHUD+Gallon.m
//  MeiYaoNiJS
//
//  Created by gallon on 17/6/7.
//  Copyright © 2017年 gallon. All rights reserved.
//

#import "MBProgressHUD+Gallon.h"

#define Screen_W [[UIScreen mainScreen] bounds].size.width
#define Screen_H [[UIScreen mainScreen] bounds].size.height

@implementation MBProgressHUD (Gallon)

static const MBProgressHUD *hud;
//有图形的提醒，自动退出
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
  if (view == nil)
    view = [[UIApplication sharedApplication].windows lastObject];
  
  // 快速显示一个提示信息
  hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  
  if (icon == nil) {
    hud.margin = 15;
  }
  
  hud.label.text = text;
  hud.label.font = [UIFont systemFontOfSize:15.0];
  hud.contentColor = [UIColor whiteColor];
  hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.9];
  //自定义动画
  hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
  hud.mode = MBProgressHUDModeCustomView;
  hud.animationType = MBProgressHUDAnimationZoom;
  hud.removeFromSuperViewOnHide = YES;
  
  [hud hideAnimated:YES afterDelay:1.5];
}



+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
  [self show:success icon:@"success.png" view:view];
}

+ (void)showError:(NSString *)error toView:(UIView *)view
{
  [self show:error icon:@"warning.png" view:view];
}

+ (void)showSuccess:(NSString *)succes
{
  [self showSuccess:succes toView:nil];
}

+ (void)showError:(NSString *)error
{
  [self showError:error toView:nil];
}



+ (void)showTips:(NSString *)tips toView:(UIView *)view
{
  [self show:tips icon:nil view:view];
  
  CGFloat offsetY = Screen_H*0.5 - 100;
  
  
  [hud setOffset:CGPointMake(0.f, offsetY)];
}

+ (void)showTips:(NSString *)tips
{
  [self showTips:tips toView:nil];
}


//显示加载动画
+ (MBProgressHUD *)showHUDwithMessage:(NSString *)message toView:(UIView *)view
{
  if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
  // 快速显示一个提示信息
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  hud.label.text = message;
    hud.mode=MBProgressHUDModeCustomView;
    //自定义动画
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30 , 30)];
    NSMutableArray*gifArray=[[NSMutableArray alloc]init];
    for (int i=3; i<=15; i++) {
        UIImage*img=[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        [gifArray addObject:img];
    }
    hud.bezelView.style=MBProgressHUDModeCustomView;
    gifImageView.animationImages=gifArray;
    gifImageView.animationDuration=3;
    gifImageView.animationRepeatCount=9999;
    hud.customView = gifImageView;
    [gifImageView startAnimating];
    
  hud.removeFromSuperViewOnHide = YES;
  hud.contentColor = [UIColor whiteColor];
  hud.bezelView.color=[UIColor clearColor];
  return hud;
}

+ (MBProgressHUD *)showHUDwithMessage:(NSString *)message
{
  return [self showHUDwithMessage:message toView:nil];
}



+ (void)hideHUDForView:(UIView *)view
{
  [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
  [self hideHUDForView:nil];
}

- (void)hide
{
  [self hideAnimated:YES];
}


@end
