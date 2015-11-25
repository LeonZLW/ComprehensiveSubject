//
//  FoldTableListVC.m
//  ComprehensiveSubject
//
//  Created by Leon on 15/11/24.
//  Copyright © 2015年 Cooker_Oranization. All rights reserved.
//

#import "FoldTableListVC.h"

@interface FoldTableListVC ()
@property (nonatomic, strong) NSMutableArray *sectionArr1;
@property (nonatomic, strong) NSMutableArray *sectionArr2;
@property (nonatomic, strong) NSMutableArray *sectionArr3;
@property (nonatomic, strong) NSMutableArray *wholeArr;
@property (nonatomic, strong) NSMutableArray *keyArr;
@property (nonatomic, copy) NSArray *sourcesArr;
@property (nonatomic, assign) BOOL flag;
@end

@implementation FoldTableListVC
- (NSMutableArray *)sectionArr1
{
    if (_sectionArr1 == nil) {
        _sectionArr1 = (NSMutableArray *)@[@"leon",@"just",@"to",@"create",@"subject"];
    }
    return _sectionArr1;
}
- (NSMutableArray *)sectionArr2
{
    if (_sectionArr2 == nil) {
        _sectionArr2 = (NSMutableArray *)@[@"只是",@"测试",@"一个",@"这个",@"可否"];
    }
    return _sectionArr2;
}
- (NSMutableArray *)sectionArr3
{
    if (_sectionArr3 == nil) {
        _sectionArr3 = (NSMutableArray *)@[@"也许",@"可以",@"成功",@"也",@"说不定"];
    }
    return _sectionArr3;
}
// 可变的整个数据包
- (NSMutableArray *)wholeArr
{
    if (_wholeArr == nil) {
        _wholeArr = [NSMutableArray array];
        [_wholeArr addObject:self.sectionArr1];
        [_wholeArr addObject:self.sectionArr2];
        [_wholeArr addObject:self.sectionArr3];

    }
    return _wholeArr;
}
// 源数据
- (NSArray *)sourcesArr
{
    if (_sourcesArr == nil) {
        _sourcesArr = @[self.sectionArr1, self.sectionArr2, self.sectionArr3];
    }
    return _sourcesArr;
}
// 记录section的状态数组
- (NSMutableArray *)keyArr
{
    if (_keyArr == nil) {
        _keyArr = [NSMutableArray array];
        for (NSUInteger i = 0 ; i < self.wholeArr.count; i ++) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"key"];
            [_keyArr addObject:dic];
        }
    }
    return _keyArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.wholeArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.wholeArr[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.textLabel.text = [self.wholeArr[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - 选择Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc]init];
    sectionView.backgroundColor = [UIColor cyanColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.tag = section;
    if ([self.wholeArr[section] count] == 0) {
        [button setTitle:@"展开" forState:UIControlStateNormal];
    }else {
        
        [button setTitle:@"收缩" forState:UIControlStateNormal];
    }
    
    [button addTarget:self action:@selector(testButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(self.view.bounds.size.width - 80, 0, 80, 30);
    [sectionView addSubview:button];
    
    return sectionView;
}

- (void)testButtonAction:(UIButton *)button
{
    NSInteger indexpath = button.tag;
    NSMutableArray *arr = [NSMutableArray array];
    
    if ([[[self.keyArr objectAtIndex:indexpath] objectForKey:@"key"] isEqualToString:@"YES"]) {
        
        [self.wholeArr replaceObjectAtIndex:indexpath withObject:arr];
        
        NSIndexSet *index = [NSIndexSet indexSetWithIndex:button.tag];
        self.keyArr[indexpath][@"key"] = @"NO";
        [button setTitle:@"展开" forState:UIControlStateNormal];
        [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationFade];
        
    }else if([[[self.keyArr objectAtIndex:indexpath] objectForKey:@"key"] isEqualToString:@"NO"]){
        arr = self.sourcesArr[indexpath];
        [self.wholeArr replaceObjectAtIndex:indexpath withObject:arr];
        
        NSIndexSet *index = [NSIndexSet indexSetWithIndex:indexpath];
        [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationFade];
        self.keyArr[indexpath][@"key"] = @"YES";
    }
}
#pragma mark -返回Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}



@end
