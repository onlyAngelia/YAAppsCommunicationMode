//
//  YATableViewAdapter.h
//  YAAppsCommunicationMode
//
//  Created by lanjiying on 2018/4/17.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const TABLEVIEWCELLID;

@interface YATableViewAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *view;
@property (nonatomic, readonly) NSMutableArray *dataSource;
@property (nonatomic,copy)void (^didCellSelected)(NSIndexPath *indexPath);
@property (nonatomic,copy)void (^afterReuseCell)(NSIndexPath *indexPath);
@property (nonatomic,assign)BOOL deselectedAnimated;
@property (nonatomic,copy)void (^didScroll)(UIScrollView *scrollView);

- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)reloadData:(NSArray *)data;
- (void)appendData:(NSArray *)data;

- (void)goTop:(BOOL)animated;

- (UITableViewHeaderFooterView *)creatHeaderFooter:(Class)class tableView:(UITableView *)tableView;
- (UITableViewCell *)createCell:(Class)class tableView:(UITableView *)tableView;

@end

