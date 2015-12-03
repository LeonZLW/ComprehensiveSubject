//
//  HomeTableVC.m
//  ComprehensiveSubject
//
//  Created by Leon on 15/11/24.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "HomeTableVC.h"
#import "ConstraintControl.h"
#import "FoldTableListVC.h"
#import "ShowImageVC.h"

static NSString *reuseCell = @"listCell";

@interface HomeTableVC ()
@property (nonatomic, copy) NSArray *dataList;

@end

@implementation HomeTableVC
- (NSArray *)dataList
{
    if (_dataList == nil) {
        _dataList = @[@"使用Autolayout动态修改复合型Cell-方法1", @"折叠列表", @"点击图片动画放大浏览(支持放大缩小)"];
        
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"OrderList";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCell];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcTitle = self.dataList[indexPath.row];
    switch (indexPath.row) {
        case 0:{
            ConstraintControl *conVC = [[ConstraintControl alloc]init];
            conVC.title = vcTitle;
            [self.navigationController pushViewController:conVC animated:YES];
            break;
        }
        case 1:{
            FoldTableListVC *foldVC = [[FoldTableListVC alloc]initWithStyle:UITableViewStyleGrouped];
            foldVC.title = vcTitle;
            [self.navigationController pushViewController:foldVC animated:YES];
            break;
        }
        case 2:{
            ShowImageVC *showImageVC = [[ShowImageVC alloc]init];
            showImageVC.title = vcTitle;
            [self.navigationController pushViewController:showImageVC animated:YES];
            break;
        }
        default:
            break;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
