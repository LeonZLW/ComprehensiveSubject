//
//  AutoCell.m
//  复合型Cell处理
//
//  Created by Leon on 15/11/24.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.



#import "AutoCell.h"

@interface AutoCell()
// imageView 到 父视图的约束线
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewToSuperView;
// imageView 到 附属图的第二条约束线
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewToSuperView2;
// imageView 到 Label的约束线
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewToLabel;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIButton *myButton;



@end

@implementation AutoCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)hideLabelLayout
{
    self.myLabel.hidden = YES;
    self.myButton.hidden = NO;
    self.myView.hidden = NO;
    self.myImageView.hidden = NO;
    self.imageViewToLabel.priority = 256;
    
    if (self.imageViewToSuperView.priority != 999) {
        self.imageViewToSuperView.priority = 999;
    }
}


- (void)hideImageAboveLayout
{
    self.myButton.hidden = YES;
    self.myView.hidden = YES;
    self.myLabel.hidden = YES;
    self.myImageView.hidden = NO;
    
    self.imageViewToLabel.priority = 256;
    self.imageViewToSuperView.priority = 257;
    
    if (self.imageViewToSuperView2.priority != 999) {
        self.imageViewToSuperView2.priority = 999;
    }
}


- (void)setNormalLayout
{
    self.myLabel.hidden = NO;
    self.myButton.hidden = NO;
    self.myView.hidden = NO;
     self.imageViewToSuperView.priority = 256;
    self.imageViewToSuperView2.priority = 257;
    
   if (self.imageViewToLabel.priority != 999) {
        
        self.imageViewToLabel.priority = 999;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
