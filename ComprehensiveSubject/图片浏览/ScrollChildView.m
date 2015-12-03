//
//  ScrollChildView.m
//
//  Created by Leon on 15/12/3.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ScrollChildView.h"
#import "ImageScroll.h"

@interface ScrollChildView ()<UIScrollViewDelegate>

@end

@implementation ScrollChildView

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageUrl
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initilizeWithImage:imageUrl frame:frame];
        [self setMinimumZoomScale:1.0f];
        [self setMaximumZoomScale:3.0f];
        self.delegate = self;
    }
    return self;
}

- (void)initilizeWithImage:(NSString *)imageUrl frame:(CGRect)frame
{
    self.imageView = [[ImageScroll alloc]initWithFrame:CGRectMake(0, 0,frame.size.width , frame.size.height)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", imageUrl]];
    [_imageView setupimageIcon];
    [self addSubview:_imageView];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

//当滑动结束时
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
//    //把当前的缩放比例设进ZoomScale，以便下次缩放时实在现有的比例的基础上
//    NSLog(@"scale is %f",scale);
    [self setZoomScale:scale animated:NO];
}
@end
