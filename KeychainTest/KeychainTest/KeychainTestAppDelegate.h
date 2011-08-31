//
//  KeychainTestAppDelegate.h
//  KeychainTest
//
//  Created by baek hojun on 11. 8. 31..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeychainTestAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
- (IBAction)insertA:(id)sender;
- (IBAction)deleteA:(id)sender;
- (IBAction)confirmA:(id)sender;
@end
