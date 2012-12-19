//
//  Person.m
//  EmployeeDatabase
//
//  Created by Rakhim Davletkaliyev on 12-11-24.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)init {
    if (self = [super init]) {
        _name = @"Unnamed Person";
        _raise = 0.1;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeFloat:_raise forKey:@"raise"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _raise = [aDecoder decodeFloatForKey:@"raise"];
    }
    return self;
}

@end
