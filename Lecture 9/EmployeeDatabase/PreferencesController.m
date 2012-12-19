//
//  PreferencesController.m
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "PreferencesController.h"

@interface PreferencesController ()

@end

@implementation PreferencesController

NSString *const HEXLTableBgColorKey = @"HEXLTableBgColorKey";
NSString *const HEXLEmptyDocKey = @"HEXLEmptyDocKey";
NSString *const HEXLColorChangeNotification = @"HEXLColorChangeNotification";

+(void)initialize {
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    [defaultValues setObject:colorAsData forKey:HEXLTableBgColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:HEXLEmptyDocKey];
    
    [[NSUserDefaults standardUserDefaults]registerDefaults:defaultValues];
}

-(id)init {
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [colorWell setColor:[PreferencesController preferenceTableBgColor]];
    [checkBox setState:[PreferencesController preferenceEmptyDoc]];
}

+(NSColor*)preferenceTableBgColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:HEXLTableBgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

+(void)setPreferenceTableBgColor:(NSColor *)color {
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorAsData forKey:HEXLTableBgColorKey];
}

+(BOOL)preferenceEmptyDoc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:HEXLEmptyDocKey];
}

+(void)setPreferenceEmptyDoc:(BOOL)emptyDoc {
    [[NSUserDefaults standardUserDefaults] setBool:emptyDoc forKey:HEXLEmptyDocKey];
}

-(IBAction)changeBackgroundColor:(id)sender {
    [PreferencesController setPreferenceTableBgColor:[colorWell color]];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSDictionary *d = [NSDictionary dictionaryWithObject:[colorWell color] forKey:@"color"];
    [nc postNotificationName:HEXLColorChangeNotification object:self userInfo:d];
}

-(IBAction)changeNewEmptyDoc:(id)sender {
    [PreferencesController setPreferenceEmptyDoc:[checkBox state]];
}

@end
