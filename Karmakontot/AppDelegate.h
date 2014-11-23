//
//  AppDelegate.h
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>
#import "CoreData+MagicalRecord.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
// This method will handle ALL the session state changes in the app


@end

