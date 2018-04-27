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

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)CommunicationAdapter *adapter;
@property(nonatomic, strong)UIDocumentInteractionController *documentInteractionController;

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
        _adapter = [[CommunicationAdapter alloc] initWithDataSource:@[@"URL Scheme",@"Keychain",@"UIPasteboard",@"UIActivityViewController/Air Drop",@"UIDocumentInteractionController/Quick Look",@"App Extension",@"Groups",@"local socket"]];
    }
    return _adapter;
}
- (void)deployObjectsBlock
{
    __weak typeof (&*self)wself = self;
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
            case 3:{
                [YAAppsCommunication communicationWithActivityViewController];
            }
                break;
            case 4:{
                [wself communicationWithDocumentInteractionController];
            }
                break;
            default:
                break;
        }
    };
}

-(void)communicationWithDocumentInteractionController
{
    [[self documentInteractionController] presentOptionsMenuFromRect:self.view.bounds inView:self.view animated:YES];
}
- (UIDocumentInteractionController *)documentInteractionController
{
    if (!_documentInteractionController) {
#warning must save at the doucuments
        NSURL* documentsUrl = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
        NSURL* destinationUrl = [documentsUrl URLByAppendingPathComponent:@"wxpay.jpeg"];
        
        NSData *pathData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mine_wxpay@2x" ofType:@"jpeg"]];
        [pathData writeToURL:destinationUrl atomically:YES];
        _documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:destinationUrl];
        _documentInteractionController.delegate = self;
        _documentInteractionController.UTI = @"public.image";
    }
    return _documentInteractionController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
