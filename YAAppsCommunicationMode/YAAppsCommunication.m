//
//  YAAppsCommunication.m
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YAAppsCommunication.h"
#import <UIKit/UIKit.h>
#import "YAKeyChain.h"

@implementation YAAppsCommunication

+ (void)communicationWithURLScheme
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"AppsCommunicationTest://?nick:lanjiying&age:18"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"AppsCommunicationTest://?nick:lanjiying&age:18"]];
    }else{
        [YAAppsCommunication showAlert:@"no this Apps " message:@"you can build another app on your phone"];
    }
}
+ (void)communicationWithKeyChain
{
    NSDictionary *userInfo = @{@"nick":@"lanjiying",@"age":@"18",@"user_image":[UIImage imageNamed:@"my_information_user"]};

    if ([YAKeyChain keyChainSaveData:userInfo withIdentifier:@"userinfo"]) {
        NSLog(@"%@",[YAKeyChain keyChainReadData:@"userinfo"]);
        [YAAppsCommunication showAlert:@"save successed" message:@"Congratulations! The data save successfully and you can open another app in order to check the data"];
    }else{
        [YAAppsCommunication showAlert:@"save fail" message:@"check your data"];
    }
    
}
+ (void)showAlert:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    [[[UIApplication sharedApplication]keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
}
@end
