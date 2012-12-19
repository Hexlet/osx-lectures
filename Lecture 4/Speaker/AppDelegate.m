//
//  AppDelegate.m
//  Speaker
//
//  Created by Rakhim Davletkaliyev on 12-11-12.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    speaker = [[NSSpeechSynthesizer alloc] initWithVoice:NULL];
    [speaker setDelegate:self];
}

- (IBAction)speakIt:(id)sender {
    [speaker startSpeakingString:[_textField stringValue]];
}

- (IBAction)stopIt:(id)sender {
    [speaker stopSpeaking];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking {
    [_textField setStringValue:@""];
}

@end
