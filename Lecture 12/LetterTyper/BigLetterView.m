//
//  BigLetterView.m
//  LetterTyper 2
//
//  Created by Rakhim Davletkaliyev on 12-11-19.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bgColor = [NSColor blueColor];
        string = @"";
        [self prepareAttributes];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSRect bound = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bound];
    [self drawStringCenteredIn:bound];
    if ( [[self window] firstResponder] == self){
        [[NSColor keyboardFocusIndicatorColor] set];
        [NSBezierPath setDefaultLineWidth:5.0];
        [NSBezierPath strokeRect:bound];
    }
}

-(BOOL) isOpaque {
    return YES;
}

-(BOOL)acceptsFirstResponder { return YES; };
-(BOOL)resignFirstResponder { return YES; };
-(BOOL)becomeFirstResponder { return YES; };

-(void)keyDown:(NSEvent *)theEvent {
    
    [self interpretKeyEvents:[NSArray arrayWithObject:theEvent]];
}

-(void)insertText:(id)insertString {
    NSLog(@"%@", insertString);
    [self setString:insertString];
}

-(void)insertTab:(id)sender {
    [[self window] selectKeyViewFollowingView:self];
}

-(void)insertBacktab:(id)sender {
    [[self window] selectKeyViewPrecedingView:self];
}

-(void)setBgColor:(NSColor *)newColor {
    bgColor = newColor;
    [self setNeedsDisplay:YES];
}

-(NSColor*)bgColor {
    return bgColor;
}

-(void)setString:(NSString *)newString {
    string = newString;
    [self setNeedsDisplay:YES];
}

-(NSString*)string  {
    return string;
}

-(void)prepareAttributes {
    attributes = [NSMutableDictionary dictionary];
    [attributes setObject:[NSFont userFontOfSize:80] forKey:NSFontAttributeName];
    [attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
}

-(void)drawStringCenteredIn:(NSRect) r {
    NSSize strSize = [string sizeWithAttributes:attributes];
    NSPoint strOrigin;
    strOrigin.x = r.origin.x + (r.size.width - strSize.width)/2;
    strOrigin.y = r.origin.y + (r.size.height - strSize.height)/2;
    [string drawAtPoint:strOrigin withAttributes:attributes];
}

-(IBAction)savePDF:(id)sender {
    __block NSSavePanel *panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"pdf"]];
    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result)  {
        if (result == NSOKButton) {
            NSRect r = [self bounds];
            NSData *data = [self dataWithPDFInsideRect: r];
            NSError *error;
            BOOL successful = [data writeToURL: [panel URL] options: 0 error:&error];
            if (!successful) {
                NSAlert *a = [NSAlert alertWithError: error];
                [a runModal];
            }
        }
        panel = nil;
    }];
}

-(void)writeToPasteboard: (NSPasteboard *)pb {
    [pb clearContents];
    [pb writeObjects:[NSArray arrayWithObject:string]];
}

-(BOOL)readFromPasteboard:(NSPasteboard *) pb {
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    NSArray *objects = [pb readObjectsForClasses:classes options:nil];
    if([objects count] > 0) {
        NSString *value = [objects objectAtIndex:0];
        if ([value length] == 1) {
            [self setString:value];
            return YES;
        }
    }
    return NO;
}

-(IBAction)cut:(id)sender{
    [self copy:sender];
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [self writeToPasteboard:pb];
    [self setString:@""];}

-(IBAction)copy:(id)sender{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [self writeToPasteboard:pb];
}

-(IBAction)paste:(id)sender {
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    if (![self readFromPasteboard:pb]) {
        NSBeep();
    }
}
d

-(void)mouseDown:(NSEvent *)theEvent {
    mouseDownEvent = theEvent;
}

-(void)mouseDragged:(NSEvent *)theEvent {
    NSPoint down = [mouseDownEvent locationInWindow];
    NSPoint drag = [theEvent locationInWindow];
    float distance = hypot(down.x-drag.x, down.y-drag.y);
    if (distance < 3 || [string length] == 0) {
        return;
    }
    NSSize s = [string sizeWithAttributes:attributes];
    NSImage *anImage = [[NSImage alloc]initWithSize:s];
    NSRect imageBounds;
    imageBounds.origin = NSZeroPoint;
    imageBounds.size = s;
    [anImage lockFocus];
    [self drawStringCenteredIn:imageBounds];
    [anImage unlockFocus];
    
    NSPoint p = [self convertPoint:down fromView:nil];
    p.x = p.x - s.width/2;
    p.y = p.y - s.height/2;
    
    NSPasteboard *pb = [NSPasteboard pasteboardWithName:NSDragPboard];
    [self writeToPasteboard:pb];
    [self dragImage:anImage
                 at:p
             offset:NSZeroSize
              event:mouseDownEvent
         pasteboard: pb
             source: self
          slideBack:YES];
}





@end
