//
//  AppDelegate.h
//  UpcomingClasses
//
//  Created by Rakhim Davletkaliyev on 2013-01-29.
//  Copyright (c) 2013 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSTableView *tableView;
    NSArray *classes;
}

@property (assign) IBOutlet NSWindow *window;

@end
