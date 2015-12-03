//
//  ShowImageVC.m
//  ComprehensiveSubject
//
//  Created by Leon on 15/12/3.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ShowImageVC.h"
#import "ShowScrollmage.h"
#import "ShowImageTool.h"

@interface ShowImageVC ()
@property (nonatomic, copy)NSArray *images;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ShowImageVC


    
- (NSArray *)images{
        if (_images == nil) {
            _images = @[@"1", @"2", @"3", @"4"];
        }
        return _images;
    }
- (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestrueAction)];
        imageTap.numberOfTapsRequired = 1.0;
        
        self.imageView.image = [UIImage imageNamed:@"1.png"];
        [self.imageView addGestureRecognizer:imageTap];
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
}
- (void)gestrueAction{
    
        [ShowImageTool showImageArr:self.images image:self.imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
