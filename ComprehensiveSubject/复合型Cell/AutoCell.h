//
//  AutoCell.h
//  复合型Cell处理
//
//  Created by Leon on 15/11/24.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#warning 主要思路: 根据需求 改变约束的优先级来布局UI

#import <UIKit/UIKit.h>

@interface AutoCell : UITableViewCell

// 正常都显示的Cell
- (void)setNormalLayout;
// 隐藏Label imageView上移到Label所在位置
- (void)hideLabelLayout;
// button View Label 都隐藏 imageView上移到Button所在位置
- (void)hideImageAboveLayout;
@end
