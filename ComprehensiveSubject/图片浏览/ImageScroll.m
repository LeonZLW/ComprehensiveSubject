//
//  ImageScroll.m
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ImageScroll.h"

#define MAIN_SCREEN ([UIScreen mainScreen].bounds)

@implementation ImageScroll


- (void)setupImageGesture
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
}
- (void)tapAction:(UITapGestureRecognizer *)tap
{
//    NSLog(@"%@", tap.view);
//    CGPoint localPoint = [tap locationInView:tap.view];
//    CGRect localRect = CGRectMake(localPoint.x, localPoint.y, 60, 50);
//    UIView *view = [[UIView alloc]initWithFrame:localRect];
//    view.backgroundColor = [UIColor redColor];
//    [self addSubview:view];
}
- (void)setupimageIcon
{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//
//    view.center = CGPointMake(220, 200);
//    CGFloat x = 100.0 / 375.0;
//    CGFloat y  = 200.0 / 667.0;
//    NSLog(@"%f, %f", x, y);
//    view.center = CGPointMake( 220 * (MAIN_SCREEN.size.width / 320), 200 * (MAIN_SCREEN.size.height / 568) );
//    view.backgroundColor = [UIColor redColor];
//    [self addSubview:view];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
