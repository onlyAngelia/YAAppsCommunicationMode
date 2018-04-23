//
//  YAActivity.m
//  YAAppsCommunicationMode
//
//  Created by lanjiying on 2018/4/23.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YAActivity.h"

static NSString *UIActivityCustomType = @"UIActivityCustomType";

@implementation YAActivity
- (NSString *)activityType
{
    return UIActivityCustomType;
}
- (NSString *)activityTitle
{
    return NSLocalizedString(@"YAAppsComunication", @"");
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"icon@2x"];
}

+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"activityItems = %@", activityItems);
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"Activity prepare");
}

- (void)performActivity
{
    NSLog(@"Activity run");
}

- (void)activityDidFinish:(BOOL)completed
{
    NSLog(@"Activity finish");
}
@end
