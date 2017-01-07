//
//  PFXPlugin.h
//  PFXPluginSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPluginResult @"pluginResult"

@interface PFXPlugin : NSObject

- (void)executeWithInfo:(NSDictionary *)infoDict completion:(void(^)(NSDictionary *resultDict))completion failure:(void(^)(NSError *error))failure;

@end
