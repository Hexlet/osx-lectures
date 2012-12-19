//
//  PreferencesController.h
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const HEXLTableBgColorKey;
extern NSString *const HEXLEmptyDocKey;
extern NSString *const HEXLColorChangeNotification;

@interface PreferencesController : NSWindowController {
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkBox;
}

+(NSColor*)preferenceTableBgColor;
+(void)setPreferenceTableBgColor:(NSColor*)color;
+(BOOL)preferenceEmptyDoc;
+(void)setPreferenceEmptyDoc:(BOOL)emptyDoc;

-(IBAction)changeBackgroundColor:(id)sender;
-(IBAction)changeNewEmptyDoc:(id)sender;

@end
