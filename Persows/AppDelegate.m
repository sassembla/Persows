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

#import "KSMessenger.h"


#define PE_MASTER   (@"PE_MASTER")

enum PE_MASTER_EXEC {
    PE_MASTER_EXEC_INIT
};


@implementation AppDelegate {
    KSMessenger * messenger;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [Parse setApplicationId:PARSE_ID
                  clientKey:PARSE_KEY];

    messenger = [[KSMessenger alloc]initWithBodyID:self withSelector:@selector(receiver:) withName:PE_MASTER];
    
    [messenger callMyself:PE_MASTER_EXEC_INIT, nil];
}



- (void) receiver:(NSNotification * )notif {
    switch ([messenger execFrom:[messenger myName] viaNotification:notif]) {
        case PE_MASTER_EXEC_INIT:{
            [self save];
            
            break;
        }
            
        default:
            break;
    }
}



/**
 保存を行う
 */
- (void) save {
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    
    NSError * error;
    bool result = [testObject save:&error];
    
}

@end
