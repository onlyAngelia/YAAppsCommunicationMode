//
//  ShareViewController.m
//  YAImageShare
//
//  Created by lanjiying on 2018/4/25.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    NSExtensionItem *extensionContext = self.extensionContext.inputItems[0];
    if(extensionContext){
        NSString *contextType = @"YATypeImage";
        for (NSItemProvider * itemProvider in extensionContext.attachments) {
            if ([itemProvider hasItemConformingToTypeIdentifier:contextType]) {
                [itemProvider loadItemForTypeIdentifier:contextType options:nil completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
                   //存储到group数据中
                }];
            }
        }
        
    }
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}
@end
