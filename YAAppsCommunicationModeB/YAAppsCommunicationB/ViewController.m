//
//  ViewController.m
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "ViewController.h"
#import "YACheckData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)checkKeyChainData:(id)sender {
    [YACheckData checkKeyChainData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
