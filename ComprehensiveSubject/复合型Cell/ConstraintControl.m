//
//  ConstraintControl.m
//  ComprehensiveSubject
//
//  Created by Leon on 15/11/24.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "ConstraintControl.h"
#import "AutoCell.h"

@interface ConstraintControl ()
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ConstraintControl
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i ++) {
            NSDictionary *dic = @{@"labelText" : [NSString stringWithFormat:@"我是第%ld个Cell", i], @"identifer" : [NSString stringWithFormat:@"%ld", i]};
            [_dataArr addObject:dic];
        }
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AutoCell" bundle:nil] forCellReuseIdentifier:@"AutoCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoCell" forIndexPath:indexPath];
    
    switch (indexPath.row %3) {
        case 0:
            [cell hideLabelLayout];
            break;
        case 1:
            [cell hideImageAboveLayout];
            break;
        default:
            [cell setNormalLayout];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
@end
