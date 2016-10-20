//
//  PingPayManager.m
//  PingPayManager
//
//  Created by jessica on 16/10/18.
//  Copyright © 2016年 jessica. All rights reserved.
//

#import "PingPayManager.h"
#import "Pingpp.h"

@implementation PingPayManager

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setDebugMode:(BOOL)enabled
                  :(RCTResponseSenderBlock)callback)
{
    [Pingpp setDebugMode:enabled];
    callback(@[[NSNull null]]);
}

RCT_EXPORT_METHOD(handleOpenURLInIOS8:(NSURL *)url
                  :(RCTResponseSenderBlock)callback)
{
    [Pingpp handleOpenURL:url withCompletion:^(NSString *result, PingppError *error) {
        callback(@[@(error.code), result]);
    }];
}

RCT_EXPORT_METHOD(handleOpenURLInIOS9:(NSURL *)url
                  :(NSString *)sourceApplication
                  :(RCTResponseSenderBlock)callback)
{
    [Pingpp handleOpenURL:url sourceApplication:sourceApplication withCompletion:^(NSString *result, PingppError *error) {
        callback(@[@(error.code), result]);
    }];
}

RCT_EXPORT_METHOD(createPayment:(NSDictionary *)charge
                  :(NSString *)schema
                  :(RCTResponseSenderBlock)callback)
{
    [Pingpp createPayment:charge appURLScheme:schema withCompletion:^(NSString *result, PingppError *error) {
        callback(@[@(error.code), result]);
    }];
}

@end
