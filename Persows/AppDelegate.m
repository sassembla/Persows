//
//  AppDelegate.m
//  Persows
//
//  Created by sassembla on 2013/11/22.
//  Copyright (c) 2013年 sassembla. All rights reserved.
//

#import "AppDelegate.h"

#import <ParseOSX/Parse.h>

#import "ParseSettings.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [Parse setApplicationId:PARSE_ID
                  clientKey:PARSE_KEY];

    
//    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
}

@end
