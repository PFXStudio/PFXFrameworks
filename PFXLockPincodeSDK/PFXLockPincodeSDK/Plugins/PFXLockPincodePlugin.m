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
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    PFXLockPincodeViewController *lockPincodeViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:bundle] instantiateViewControllerWithIdentifier:NSStringFromClass([PFXLockPincodeViewController class])];
    [[[UIApplication sharedApplication].windows lastObject].rootViewController presentViewController:lockPincodeViewController animated:YES completion:nil];
    
}

@end
