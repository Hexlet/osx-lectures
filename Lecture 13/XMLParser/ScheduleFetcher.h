//
//  ScheduleFetcher.h
//  UpcomingClasses
//
//  Created by Rakhim Davletkaliyev on 2013-01-29.
//  Copyright (c) 2013 Rakhim Davletkaliyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleFetcher : NSObject <NSXMLParserDelegate> {
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
}

-(NSArray*)fetchClassesWithError:(NSError**)outError;

@end
