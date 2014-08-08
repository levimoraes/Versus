//
//  MELAppDelegate.h
//  Versus
//
//  Created by Levi Santos on 08/08/14.
//  Copyright (c) 2014 Eduardo Levi Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MELAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
