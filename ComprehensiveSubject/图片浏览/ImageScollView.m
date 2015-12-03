//
//  ImageScollView.m
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ImageScollView.h"

@implementation ImageScollView
{
    ScrollType _scrollStyle;
    CGRect _scrollF;
    NSInteger _imageCount;
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images scrollType:(ScrollType)scrollStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollStyle = scrollStyle;
        _scrollF = frame;
        _imageCount = images.count;
        
        [self setupScrollWithImages:images];
        [self initilizeWithFrame:frame images:images];
    }
    return self;
}

// 初始化
- (void)initilizeWithFrame:(CGRect)rectF images:(NSArray *)images
{
    // local images
    for (NSInteger i = 0; i < _imageCount; i++) {
        ImageScroll *imageView = [[ImageScroll alloc]initWithFrame:CGRectMake(SCROLL_W * i, 0, SCROLL_W, SCROLL_H)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", images[i]]];
        [imageView setupImageGesture];
        [self addSubview:imageView];
    }
}

// 设置scrollView
- (void)setupScrollWithImages:(NSArray *)images 
{
    self.contentSize = CGSizeMake(SCROLL_W * _imageCount, SCROLL_H);
    self.pagingEnabled = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
