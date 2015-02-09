//
//  AppDelegate.m
//  QuizAppiPhone
//
//  Created by Saiteja Samudrala on 7/15/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _view = [[ViewController alloc]init];
 
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   
    

    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"this was executed");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}

@end
