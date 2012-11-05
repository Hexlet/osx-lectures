//
//  AppDelegate.m
//  AwesomeRandom
//
//  Created by Rakhim Davletkaliyev on 12-11-05.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(IBAction)see:(id)sender {
    srandom((unsigned)time(NULL));
}

-(IBAction)generate:(id)sender {
    int num = (int)((random() % 100) +1);
    [textField setIntValue:num];
}

@end
