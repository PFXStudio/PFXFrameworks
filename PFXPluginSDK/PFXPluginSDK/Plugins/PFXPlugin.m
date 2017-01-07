//
//  PFXPlugin.m
//  PFXPluginSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "PFXPlugin.h"

@interface PFXPlugin ()

@property (strong, nonatomic) NSDictionary *infoDict;
@property (strong, nonatomic) void(^completionBlock)(NSDictionary *resultDict);
@property (strong, nonatomic) void(^failureBlock)(NSError *error);

@end

@implementation PFXPlugin

- (void)executeWithInfo:(NSDictionary *)infoDict completion:(void(^)(NSDictionary *resultDict))completion failure:(void(^)(NSError *error))failure
{
    self.infoDict = infoDict;
    self.completionBlock = completion;
    self.failureBlock = failure;
}

@end
