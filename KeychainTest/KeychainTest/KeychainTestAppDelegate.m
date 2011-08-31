//
//  KeychainTestAppDelegate.m
//  KeychainTest
//
//  Created by baek hojun on 11. 8. 31..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "KeychainTestAppDelegate.h"
#import "SSKeychain.h"
#define SERVICE @"<Your Service>"
#define PASSWORD @"<Your Account>"
#define NIL 7373
@interface KeychainTestAppDelegate()
- (void)printForError:(NSInteger)errorCode;
@end
@implementation KeychainTestAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  [self.window makeKeyAndVisible];
    return YES;
}

- (IBAction)insertA:(id)sender {
  NSLog(@"************************");
  NSLog(@"Insert");
  NSError *error = nil;
  if ([SSKeychain setPassword:@"asdfasdf"
               forService:SERVICE
                  account:PASSWORD
                        error:&error]) {
    NSLog(@"Insert Successful");
  } else {
    NSLog(@"Insert failed");
    [self printForError:[error code]];    
  }

  
}
- (IBAction)deleteA:(id)sender {
  NSLog(@"************************");
  NSLog(@"Delete");
  NSError *error = nil;
  if ([SSKeychain deletePasswordForService:SERVICE 
                               account:PASSWORD
                                     error:&error]) {
    NSLog(@"Delete Successful");    
  } else {
    NSLog(@"Delete failed");    
    [self printForError:[error code]];        
  }

  
}
- (IBAction)confirmA:(id)sender {
  NSLog(@"************************");  
  NSLog(@"Confirm");
  NSError *error = nil;
  NSString *password = [SSKeychain passwordForService:SERVICE account:PASSWORD error:&error];
  NSLog(@"password is %@",password);
  [self printForError:error==nil?NIL:[error code]];     
}

- (void)printForError:(NSInteger)errorCode {
  switch (errorCode) {
    case NIL:
      NSLog(@"error:nil object");            
      break;
      
    case SSKeychainErrorBadArguments:
      NSLog(@"error:SSKeychainErrorBadArguments");            
      break;
      
    case SSKeychainErrorNoPassword:
      NSLog(@"error:SSKeychainErrorNoPassword");            
      break;
      
    case SSKeychainErrorInvalidParameter:
      NSLog(@"error:SSKeychainErrorInvalidParameter");            
      break;

    case SSKeychainErrorFailedToAllocated:
      NSLog(@"error:SSKeychainErrorFailedToAllocated");            
      break;

    case SSKeychainErrorNotAvailable:
      NSLog(@"error:SSKeychainErrorNotAvailable");            
      break;

    case SSKeychainErrorAuthorizationFailed:
      NSLog(@"error:SSKeychainErrorAuthorizationFailed");            
      break;

    case SSKeychainErrorDuplicatedItem:
      NSLog(@"error:SSKeychainErrorDuplicatedItem");            
      break;

    case SSKeychainErrorNotFound:
      NSLog(@"error:SSKeychainErrorNotFound");            
      break;

    case SSKeychainErrorInteractionNotAllowed:
      NSLog(@"error:SSKeychainErrorInteractionNotAllowed");      
      break;

    case SSKeychainErrorFailedToDecode:
      NSLog(@"error:SSKeychainErrorFailedToDecode");      
      break;

    default:
      NSLog(@"other error");
      break;
  }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
    [super dealloc];
}

@end
