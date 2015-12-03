//
//  ImageScollView.h
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScroll.h"

typedef NS_ENUM(NSUInteger, ScrollType) {
    NormalStyle,
};

#define SCROLL_W  (self.frame.size.width)
#define SCROLL_H  (self.frame.size.height)

@interface ImageScollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images scrollType:(ScrollType)scrollStyle;

@end
