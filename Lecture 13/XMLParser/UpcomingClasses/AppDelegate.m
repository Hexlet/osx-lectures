//
//  AppDelegate.m
//  UpcomingClasses
//
//  Created by Rakhim Davletkaliyev on 2013-01-29.
//  Copyright (c) 2013 Rakhim Davletkaliyev. All rights reserved.
//

#import "AppDelegate.h"
#import "ScheduleFetcher.h"
#import "ScheduledClass.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [tableView setTarget:self];
    [tableView setDoubleAction:@selector(openClass:)];
    
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc]init];
    NSError *error = nil;
    classes = [fetcher fetchClassesWithError:&error];
    [tableView reloadData];
}

-(void)openClass:(id)sender {
    ScheduledClass *c = [classes objectAtIndex:[tableView clickedRow]];
    NSURL *baseURL = [NSURL URLWithString:@"http://bignerdranch.com/"];
    NSURL *url = [NSURL URLWithString:[c href] relativeToURL:baseURL];
    
    [[NSWorkspace sharedWorkspace] openURL:url];
}

-(NSInteger) numberOfRowsInTableView:(NSTableView*)theTableView {
    return [classes count];
}

-(id)tableView:(NSTableView*)theTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    ScheduledClass *c = [classes objectAtIndex:row];
    return [c valueForKey:[tableColumn identifier]];
}

@end
