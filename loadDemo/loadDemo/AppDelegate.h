//
//  AppDelegate.h
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSManagedObjectModel *manageObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *manageObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persostentStore;
@end
