//
//  ScrollChildView.h
//
//  Created by Leon on 15/12/3.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageScroll;

@interface ScrollChildView : UIScrollView
@property (nonatomic, strong)ImageScroll *imageView;

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageUrl;
@end
