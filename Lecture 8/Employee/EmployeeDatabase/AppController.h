//
//  AppController.h
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PreferencesController;

@interface AppController : NSObject {
    PreferencesController *preferences;
}

-(IBAction)showPreferencesPanel:(id)sender;

@end
