//
//  BigLetterView.h
//  LetterTyper 2
//
//  Created by Rakhim Davletkaliyev on 12-11-19.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView {
    NSColor *bgColor;
    NSString *string;
    NSMutableDictionary *attributes;
    NSEvent *mouseDownEvent;
}

-(void)prepareAttributes;
-(IBAction)savePDF:(id)sender;
-(IBAction) cut:(id)sender;
-(IBAction) paste:(id)sender;
-(IBAction) copy:(id)sender;

@property (strong) NSColor *bgColor;
@property (copy) NSString *string;

@end
