//
//  UITableView+adapter.m
//  YAAppsCommunicationMode
//
//  Created by lanjiying on 2018/4/17.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "UITableView+adapter.h"

@implementation UITableView (adapter)

- (void)setAdapter:(YATableViewAdapter *)adapter
{
    [self setDataSource:adapter];
    [self setDelegate:adapter];
    [adapter setView:self];
    [self reloadData];
    
}
@end
