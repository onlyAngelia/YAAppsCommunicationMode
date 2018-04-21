//
//  YACheckData.m
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YACheckData.h"
#import <UIKit/UIKit.h>
#import "YAKeyChain.h"

@implementation YACheckData
+ (void)checkKeyChainData
{
    NSDictionary *userinfo = [YAKeyChain keyChainReadData:@"userinfo"];
    if (userinfo) {
        NSArray *array = @[[NSString stringWithFormat:@"%@:%@",userinfo.allKeys[0],[userinfo objectForKey:userinfo.allKeys[0]]],[NSString stringWithFormat:@"%@:%@",userinfo.allKeys[1],[userinfo objectForKey:userinfo.allKeys[1]]],[userinfo objectForKey:userinfo.allKeys[2]]];
        [YACheckData showKeyChainData:array];
    }else{
        [YACheckData showMessageAlert:@"error" message:@"keyChain no data"];
    }
}

+ (void)showKeyChainData:(NSArray *)array
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[array objectAtIndex:0] message:[array objectAtIndex:1] preferredStyle:UIAlertControllerStyleAlert];
    UIImage *userImage = (UIImage *)[array objectAtIndex:2];
    UIImageView *userInfoImageView = [[UIImageView alloc] initWithImage:userImage];
    userInfoImageView.frame = CGRectMake(0, 0, userImage.size.width, userImage.size.height);
    userInfoImageView.center = alertController.view.center;
    [alertController.view addSubview:userInfoImageView];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow.rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
}

+(void)showMessageAlert:(NSObject *)title message:(NSObject *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@",title] message:[NSString stringWithFormat:@"%@",message] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow.rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
    
}
@end
