//
//  YAAppsCommunication.h
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YAAppsCommunication : NSObject

+(void)communicationWithURLScheme;
+ (void)communicationWithKeyChain;
+ (void)communicationWithPasteboard;

@end
