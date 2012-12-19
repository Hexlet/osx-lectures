//
//  AppController.m
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "AppController.h"
#import "PreferencesController.h"

@implementation AppController

-(IBAction)showPreferencesPanel:(id)sender {
    if (!preferences) {
        preferences = [[PreferencesController alloc]init];
    }
    [preferences showWindow:self];
}

@end
