//
//  PreferencesController.h
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferencesController : NSWindowController {
    IBOutlet NSColorWell *colorWell;
}

-(IBAction)changeBackgroundColor:(id)sender;

@end
