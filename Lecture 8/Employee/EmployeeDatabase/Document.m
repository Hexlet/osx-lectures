//
//  Document.m
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-11-24.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "Document.h"
static void *RMDocumentKVOContext;

@implementation Document

-(void)startObservingPerson:(Person *)person {
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:&RMDocumentKVOContext];
    [person addObserver:self forKeyPath:@"raise" options:NSKeyValueObservingOptionOld context:&RMDocumentKVOContext];
}

-(void)stopObservingPerson:(Person *)person {
    [person removeObserver:self forKeyPath:@"name"];
    [person removeObserver:self forKeyPath:@"raise"];
}

- (id)init
{
    self = [super init];
    if (self) {
        employees = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)setEmployees:(NSMutableArray *)empl {
    if (employees != empl) {
        for (Person *person in employees) {
            [self stopObservingPerson:person];
        }
        employees = empl;
        for (Person *person in employees) {
            [self startObservingPerson:person];
        }
    }
}


- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    [[table window] endEditingFor:nil];
    return [NSKeyedArchiver archivedDataWithRootObject:employees];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    NSMutableArray *newArray = nil;
    @try {
        newArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *e) {
        if (outError) {
            NSDictionary *d = [NSDictionary dictionaryWithObject:@"The file is invalid" forKey:NSLocalizedFailureReasonErrorKey];
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:d];
            return NO;
        }
    }
    [self setEmployees:newArray];
    return YES;
}

-(void)insertObject:(Person *)p inEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self]removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add person"];
    }
    [self startObservingPerson:p];
    [employees insertObject:p atIndex:index];
}

-(void)removeObjectFromEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    Person *p = [employees objectAtIndex:index];
    [[undo prepareWithInvocationTarget:self]insertObject:p inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove person"];
    }
    [self stopObservingPerson:p];
    [employees removeObjectAtIndex:index];
}


-(void)changeKeyPath:(NSString*)keyPath
            ofObject:(id)obj
             toValue:(id)newValue {
    [obj setValue:newValue forKeyPath:keyPath];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context != &RMDocumentKVOContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) {
        oldValue = nil;
    }
    
    [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];

    [undo setActionName:@"Edit"];
}

@end
