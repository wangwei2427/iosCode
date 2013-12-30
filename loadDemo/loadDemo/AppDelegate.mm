//
//  AppDelegate.m
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "AppDelegate.h"
#import "LoadViewController.h"
#import "MenuViewController.h"
#import "ContentViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    ContentViewController *contentViewController = [[ContentViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:contentViewController];
    nav.navigationBar.topItem.title=@"titile";
    self.window.rootViewController = nav;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSError *error;
    if (self.manageObjectContext != nil) {
        if ([self.manageObjectContext hasChanges] && ![self.manageObjectContext save:&error]) {
            NSLog(@"Error: %@ , %@",error,[error userInfo]);
        }
    }
}

- (NSPersistentStoreCoordinator *)persostentStore {
    if (_persostentStore != nil) {
        return _persostentStore;
    }
    
    //得到数据库的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //CoreData是建立在SQLite之上的，数据库名称需与Xcdatamodel文件同名
    NSURL *storeUrl = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"player.sqlite"]];
    NSError *error = nil;
    _persostentStore = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self manageObjectModel]];
    
    if (![_persostentStore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return _persostentStore;
}

- (NSManagedObjectContext *)manageObjectContext {
    if (_manageObjectContext != nil) {
        return _manageObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persostentStore];
    
    if (coordinator != nil) {
        _manageObjectContext = [[NSManagedObjectContext alloc]init];
        [_manageObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _manageObjectContext;
}

- (NSManagedObjectModel *)manageObjectModel {
    if (_manageObjectModel != nil) {
        return _manageObjectModel;
    }
    _manageObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _manageObjectModel;
}

@end
