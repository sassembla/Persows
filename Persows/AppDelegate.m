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
    PE_MASTER_EXEC_INIT,
    PE_MASTER_EXEC_GOT_ORDERS,
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
            [self loadSpecificOrder];
            [self getSingleOrder];
            [self getListOfOrdersWithRange];
            [self add];
            [self update];
            break;
        }
        case PE_MASTER_EXEC_GOT_ORDERS:{
            break;
        }
            
        default:
            NSAssert(false, @"should not reach here");
            break;
    }
}



- (void) loadSpecificOrder {
    PFQuery * query = [PFQuery queryWithClassName:@"TestObject"];
    
    [query getObjectInBackgroundWithId:@"b0iYSoQkKz" block:^(PFObject * gameScore, NSError * error) {
        if (error) {
            NSLog(@"error! %@", error);
        } else {
            // Do something with the returned PFObject in the gameScore variable.
            NSLog(@"loadSpecificOrder %@", gameScore);
        }
    }];
}


- (void) getSingleOrder {
    PFQuery * query = [PFQuery queryWithClassName:@"TestObject"];
    [query setSkip:1];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * obj, NSError * error) {
        NSLog(@"getSingleOrder %@", obj);
    }];
    
}

/**
 範囲取得
 */
- (void) getListOfOrdersWithRange {
    PFQuery * query = [PFQuery queryWithClassName:@"TestObject"];
    
    [query setSkip:1];
    [query setLimit:4];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error)
     {
         if (error) {
             NSLog(@"error %@", error);
         } else {
             for (PFObject * obj in objects) {
                 NSLog(@"obj %@", obj);
             }
             
             [messenger callMyself:PE_MASTER_EXEC_GOT_ORDERS, nil];
         }
     }];
    
}

/**
 追加を行う
 */
- (void) add {
    PFObject * testObject = [PFObject objectWithClassName:@"Order"];
    [testObject setObject:@"" forKey:@"foo"];
    [testObject setValue:@"queue" forKey:@"tes"];
    
    NSError * error;
    bool result = [testObject save:&error];
}


- (void) update {
    PFQuery * query = [PFQuery queryWithClassName:@"TestObject"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * obj, NSError * error) {
        NSLog(@"update %@", obj);
    }];
}

@end
