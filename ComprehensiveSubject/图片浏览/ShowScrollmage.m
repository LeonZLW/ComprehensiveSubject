//
//  ShowScrollmage.m
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ShowScrollmage.h"
#import "ScrollChildView.h"

@interface ShowScrollmage ()<UIScrollViewDelegate>
{
    ScrollType _scrollStyle;
    CGRect _scrollF;
    NSInteger _imageCount;
}

@end
@implementation ShowScrollmage

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
        CGRect childScrollRect = CGRectMake(SCROLL_W * i, 0, SCROLL_W, SCROLL_H);
        ScrollChildView *childScroll = [[ScrollChildView alloc]initWithFrame:childScrollRect withImage:images[i]];
        [self.scrollView addSubview:childScroll];
        
    }
    
    
}

// 设置scrollView
- (void)setupScrollWithImages:(NSArray *)images
{
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = self.bounds;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor blackColor];
    self.scrollView.contentSize = CGSizeMake(SCROLL_W * _imageCount, SCROLL_H);
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
    
    
}
#pragma mark - scrollView协议
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _didDeceleratBlock(scrollView.contentOffset.x);
}

// 开始拖拽时的偏移量
float lastContentOffset;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    lastContentOffset = scrollView.contentOffset.x;
}
// 停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self resumeChildScrollScaleWithScroll:scrollView];
}
// 还原小图的尺寸
- (void)resumeChildScrollScaleWithScroll:(UIScrollView *)scrollView
{
//    for (UIView *view in self.scrollView.subviews) {
//        NSLog(@"======%@", NSStringFromClass([view class]));
//    }
    NSInteger subViewIndex = scrollView.contentOffset.x / self.frame.size.width;
    if (subViewIndex  == 0) {
        ScrollChildView *childScrollView = self.scrollView.subviews[subViewIndex];
        ScrollChildView *childScrollView2 = self.scrollView.subviews[subViewIndex + 1];
        if ([childScrollView isKindOfClass:[ScrollChildView class]] && [childScrollView2 isKindOfClass:[ScrollChildView class]]) {
            [childScrollView setZoomScale:1.0f animated:YES];
            [childScrollView2 setZoomScale:1.0f animated:YES];
        }
        
    }else if (subViewIndex > 0 && subViewIndex < self.scrollView.subviews.count) {
     
        if (lastContentOffset < scrollView.contentOffset.x) {
            ScrollChildView *childScrollView = self.scrollView.subviews[subViewIndex];
            if ([childScrollView isKindOfClass:[ScrollChildView class]]) {
                [childScrollView setZoomScale:1.0f animated:YES];
                NSLog(@"向右滚动");
            }
        }else{
            ScrollChildView *childScrollView = self.scrollView.subviews[subViewIndex + 1];
             if ([childScrollView isKindOfClass:[ScrollChildView class]]) {
                 [childScrollView setZoomScale:1.0f animated:YES];
                 NSLog(@"向左滚动");
             }
        }
    }
}
- (void)didEndDeceleratContentoffSetBlock:(DidEndDeceleratBlock) didDeceleratBlock
{
    _didDeceleratBlock = didDeceleratBlock;
}

@end
