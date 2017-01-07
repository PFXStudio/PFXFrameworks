//
//  PFXLockPincodePlugin.m
//  PFXLockPincodeSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "PFXLockPincodePlugin.h"

@implementation PFXLockPincodePlugin

- (void)executeWithInfo:(NSDictionary *)infoDict completion:(void (^)(NSDictionary *))completion failure:(void (^)(NSError *))failure
{
    [super executeWithInfo:infoDict completion:completion failure:failure];
    NSString *pincode = [infoDict objectForKey:@"pincode"];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    PFXLockPincodeViewController *lockPincodeViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:bundle] instantiateViewControllerWithIdentifier:NSStringFromClass([PFXLockPincodeViewController class])];
    lockPincodeViewController.pincode = pincode;
    [[[UIApplication sharedApplication].windows lastObject].rootViewController presentViewController:lockPincodeViewController animated:YES completion:^{
        completion([NSDictionary dictionaryWithObjectsAndKeys:@"", kPluginResult, nil]);
    }];
}

@end
