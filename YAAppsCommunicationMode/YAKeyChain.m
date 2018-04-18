//
//  YAKeyChain.m
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YAKeyChain.h"
#import <Security/Security.h>

@implementation YAKeyChain

+(NSMutableDictionary*) keyChainIdentifier:(NSString*)identifier {
    NSMutableDictionary * keyChainMutableDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword,kSecClass,identifier,kSecAttrService,identifier,kSecAttrAccount,kSecAttrAccessibleAfterFirstUnlock,kSecAttrAccessible, nil];
    return keyChainMutableDictionary;
}

+(BOOL) keyChainSaveData:(id)data withIdentifier:(NSString*)identifier{
        // get the datas condition
    NSMutableDictionary * saveQueryMutableDictionary = [self keyChainIdentifier:identifier];
        // delete past data
    SecItemDelete((CFDictionaryRef)saveQueryMutableDictionary);
        // set new data
    [saveQueryMutableDictionary setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
        // add data into keychain
    OSStatus saveState = SecItemAdd((CFDictionaryRef)saveQueryMutableDictionary, nil);
        // free object
    saveQueryMutableDictionary = nil ;
        // get the result
    if (saveState == errSecSuccess) {
        return YES;
    }
    return NO;
}

+(id) keyChainReadData:(NSString*)identifier{
    id idObject = nil ;
        // get the data‘s condition
    NSMutableDictionary * keyChainReadQueryMutableDictionary = [self keyChainIdentifier:identifier];
        // required propertys
        // TODO: serch result retrun to  kSecValueData
    [keyChainReadQueryMutableDictionary setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
        // TODO: return the first result
    [keyChainReadQueryMutableDictionary setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyChainData = nil ;
        // search result according to the condition
    if (SecItemCopyMatching((CFDictionaryRef)keyChainReadQueryMutableDictionary , (CFTypeRef *)&keyChainData) == noErr){
        @try {
            idObject = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)(keyChainData)];
        } @catch (NSException * exception){
            NSLog(@"Unarchive of search data where %@ failed of %@ ",identifier,exception);
        }
    }
    if (keyChainData) {
        CFRelease(keyChainData);
    }
        // free object
    keyChainReadQueryMutableDictionary = nil;
        // return object
    return idObject ;
}

+(BOOL)keyChainUpdata:(id)data withIdentifier:(NSString*)identifier {
        // get the condition
    NSMutableDictionary * keyChainUpdataQueryMutableDictionary = [self keyChainIdentifier:identifier];
    NSMutableDictionary * updataMutableDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
        // save data
    [updataMutableDictionary setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
        // get status
    OSStatus  updataStatus = SecItemUpdate((CFDictionaryRef)keyChainUpdataQueryMutableDictionary, (CFDictionaryRef)updataMutableDictionary);
        // free object
    keyChainUpdataQueryMutableDictionary = nil;
    updataMutableDictionary = nil;

    if (updataStatus == errSecSuccess) {
        return  YES ;
    }
    return NO;
}


+(void) keyChainDelete:(NSString*)identifier {
        // the conditon
    NSMutableDictionary * keyChainDeleteQueryMutableDictionary = [self keyChainIdentifier:identifier];
        // delete designated data
    SecItemDelete((CFDictionaryRef)keyChainDeleteQueryMutableDictionary);
        // free object
    keyChainDeleteQueryMutableDictionary = nil ;
}

@end
