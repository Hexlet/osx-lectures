//
//  AppDelegate.h
//  AwesomeRandom
//
//  Created by Rakhim Davletkaliyev on 12-11-05.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSTextField *textField;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)generate:(id)sender;
-(IBAction)seed:(id)sender;

@end
