//
//  YAKeyChain.h
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YAKeyChain : NSObject

+(id) keyChainReadData:(NSString*)identifier ;
+(BOOL) keyChainSaveData:(id)data withIdentifier:(NSString*)identifier ;
+(BOOL)keyChainUpdata:(id)data withIdentifier:(NSString*)identifier ;
+(void) keyChainDelete:(NSString*)identifier ;

@end
