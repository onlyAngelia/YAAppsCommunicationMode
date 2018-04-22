//
//  ViewController.m
//  YAAppsCommunicationMode
//
//  Created by lanjiying on 2018/4/17.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+adapter.h"
#import "CommunicationAdapter.h"
#import "YAAppsCommunication.h"

@interface ViewController ()

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)CommunicationAdapter *adapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupUI];
    [self deployObjectsBlock];
}
- (void)setupUI
{
    [self.view addSubview:[self tableView]];
    
}
- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView setAdapter:[self adapter]];
        
    }
    return _tableView;
}
- (CommunicationAdapter *)adapter
{
    if (!_adapter) {
        _adapter = [[CommunicationAdapter alloc] initWithDataSource:@[@"URL Scheme",@"Keychain",@"UIPasteboard",@"UIActivityViewController/Air Drop",@"UIDocumentInteractionController",@"Quick Look",@"App Extension"]];
    }
    return _adapter;
}
- (void)deployObjectsBlock
{
//    __weak typeof (&*self)wself = self;
    _adapter.didCellSelected = ^(NSIndexPath *indexPath) {
        switch (indexPath.row) {
            case 0:{
                [YAAppsCommunication communicationWithURLScheme];
            }
                break;
            case 1:{
                [YAAppsCommunication communicationWithKeyChain];
            }
                break;
            case 2:{
                [YAAppsCommunication communicationWithPasteboard];
            }
                break;
            default:
                break;
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
