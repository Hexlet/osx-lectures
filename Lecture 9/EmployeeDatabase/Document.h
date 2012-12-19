//
//  Document.h
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-11-24.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface Document : NSDocument {
    NSMutableArray *employees;
    IBOutlet NSTableView *table;
}

-(void)setEmployees:(NSMutableArray *)empl;

-(void)insertObject:(Person*)p inEmployeesAtIndex:(NSInteger)index;
-(void)removeObjectFromEmployeesAtIndex:(NSInteger)index;

@end
