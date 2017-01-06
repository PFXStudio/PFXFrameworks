//
//  AppDelegate.h
//  PFXSample
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

