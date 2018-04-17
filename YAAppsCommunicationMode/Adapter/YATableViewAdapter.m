//
//  YATableViewAdapter.m
//  YAAppsCommunicationMode
//
//  Created by lanjiying on 2018/4/17.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YATableViewAdapter.h"

NSString *const TABLEVIEWCELLID = @"tableviewCellIdentifier";

@interface YATableViewAdapter()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
@implementation YATableViewAdapter
+ (instancetype)instance{
    return [[[self class] alloc] initWithDataSource:@[]];
}
- (instancetype)initWithDataSource:(NSArray *)dataSource
{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.deselectedAnimated = NO;
    }
    return self;
}
- (void)goTop:(BOOL)animated{
    [self.view setContentOffset:CGPointZero animated:animated];
}
- (void)reloadData:(NSArray *)data
{
    self.dataSource = [data mutableCopy];
    [self.view reloadData];
}
- (void)appendData:(NSArray *)data
{
    [self.dataSource addObjectsFromArray:data];
    [self.view reloadData];
}

- (void)setView:(UITableView *)view
{
    _view = view;
    [self afterSetView];
    [view registerClass:[UITableViewCell class] forCellReuseIdentifier:TABLEVIEWCELLID];
}

- (void)afterSetView
{
    
}
- (void)cellSelected:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:_deselectedAnimated];
    if (self.didCellSelected) {
        self.didCellSelected(indexPath);
    }
    [self cellSelected:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELLID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEWCELLID];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_didScroll) {
        _didScroll(scrollView);
    }
}

- (UITableViewHeaderFooterView *)creatHeaderFooter:(Class)class tableView:(UITableView *)tableView
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(class)];
    if (headerView == nil) {
        headerView = [[class alloc] initWithReuseIdentifier:NSStringFromClass(class)];
    }
    return headerView;
}

- (UITableViewCell *)createCell:(Class)class tableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (cell == nil) {
        cell = [[class alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
