//
//  AppDelegate.m
//  ExampleApp
//
//  Created by Varun Santhanam on 10/30/17.
//  Copyright © 2017 Varun Santhanam. All rights reserved.
//

@import ExampleKit;

#import <os/log.h>

#import "AppDelegate.h"

@interface AppDelegate ()<EKSessionDelegate>

@property (nonatomic, strong, readonly) EKSession *session;

@end

@implementation AppDelegate

static os_log_t example_log;

@synthesize session = _session;

#pragma mark - Overridden Instance Methods

+ (void)initialize {
    
    example_log = os_log_create("com.varunsanthanam.ExampleApp", "ExampleLog");
    
}

#pragma mark - Property Access Methods

- (EKSession *)session {
    
    if (!_session) {
        
        _session = [[EKSession alloc] initWithDelegate:self];
        
    }
    
    return _session;
    
}

#pragma mark - EKSessionDelegate

- (void)session:(EKSession *)session didBeginProcessingObject:(EKObject *)object {
    
    os_log(example_log, "Began Processing Object");
    
}

- (void)session:(EKSession *)session didFinishProcessingObject:(EKObject *)object withError:(NSError *)error {
    
    os_log(example_log, "Finished Processing Object");
    
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EKObject *object = [[EKObject alloc] initWithObjectName:@"ExampleApp"];
    [self.session processObject:object];
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
