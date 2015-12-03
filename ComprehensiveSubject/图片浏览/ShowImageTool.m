//
//  ShowImageTool.m
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ShowImageTool.h"
#import "AppDelegate.h"
#import "ShowScrollmage.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

static CGRect oldframe;
static CGFloat contentoffSet_X;

@interface ShowImageTool()

@end

@implementation ShowImageTool

+ (void)showImageArr:(NSArray *)images image:(UIImageView *)imageView
{
    contentoffSet_X = 0;
    UIImage *image = imageView.image;
   UIWindow *window = [UIApplication sharedApplication].keyWindow;
    oldframe = [imageView convertRect:imageView.bounds toView:window];
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0;
    backgroundView.tag = 1001;
    UIImageView *bk_imageView = [[UIImageView alloc]initWithFrame:oldframe];
    bk_imageView.image = image;
    bk_imageView.tag = 1000;
    bk_imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backgroundView addSubview:bk_imageView];
    [window addSubview:backgroundView];
    
    [UIView animateWithDuration:0.3 animations:^{
//        bk_imageView.frame = CGRectMake(0, (MAIN_SCREEN.size.height - image.size.height * MAIN_SCREEN.size.width / image.size.width) / 2 ,MAIN_SCREEN.size.width, image.size.height * MAIN_SCREEN.size.width / image.size.width);
        bk_imageView.frame = backgroundView.frame;
        backgroundView.alpha = 1.0;
    } completion:^(BOOL finished) {
        backgroundView.alpha = 0;
        
        ShowScrollmage *imageScroll = [[ShowScrollmage alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W   , SCREEN_H) images:images scrollType:NormalStyle];
        imageScroll.alpha = 1;
        [imageScroll didEndDeceleratContentoffSetBlock:^(CGFloat contentoffSetX) {
            contentoffSet_X = contentoffSetX;
        }];
        [window addSubview:imageScroll];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
        [imageScroll addGestureRecognizer:tap];
    }];
   
}

+ (void)hideImage:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)[[UIApplication sharedApplication].keyWindow viewWithTag:1000];
    UIView *bkView = [[UIApplication sharedApplication].keyWindow viewWithTag:1001];
    ShowScrollmage *imageScroll = (ShowScrollmage *)tap.view;
    if (contentoffSet_X >= SCREEN_W) {
        imageScroll.alpha = 1;
        bkView.alpha = 0;
        
        [UIView animateWithDuration:0.3 animations:^{
            imageScroll.alpha = 0;
            
        } completion:^(BOOL finished) {
            [bkView removeFromSuperview];
            [imageScroll removeFromSuperview];
        }];
    }else {
        imageScroll.alpha = 0;
        bkView.alpha = 1;
        
        [UIView animateWithDuration:0.3 animations:^{
            bkView.alpha = 0;
            imageView.frame = oldframe;
            
        } completion:^(BOOL finished) {
            [bkView removeFromSuperview];
            [imageScroll removeFromSuperview];
        }];
    }
    
    
    
}


@end
