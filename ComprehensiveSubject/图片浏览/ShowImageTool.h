//
//  ShowImageTool.h
//
//  Created by Leon on 15/11/30.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MAIN_SCREEN ([UIScreen mainScreen].bounds)

@interface ShowImageTool : NSObject

+ (void)showImageArr:(NSArray *)images image:(UIImageView *)imageView;
@end
