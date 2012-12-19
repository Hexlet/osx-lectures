//
//  CarArrayController.m
//  CarShop
//
//  Created by Rakhim Davletkaliyev on 12-12-10.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "CarArrayController.h"

@implementation CarArrayController

-(id)initWithCoder:(NSCoder *)aDecoder {
    return nil;
}

-(id)newObject {
    id newObj = [super newObject];
    [newObj setValue:[NSDate date] forKey:@"datePurchased"];
    [newObj setValue:@"Unknown Car" forKey:@"makeModel"];
    return newObj;
}

@end
