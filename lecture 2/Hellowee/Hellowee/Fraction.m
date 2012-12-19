//
//  Fraction.m
//  Hellowee
//
//  Created by Rakhim Davletkaliyev on 12-10-23.
//  Copyright (c) 2012 IITU. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction 

-(void) print {
    NSLog(@"%i/%i", _numerator, _denominator);
}

-(void)add: (Fraction *) f {
    [self setNumerator: self.numerator*f.denominator + self.denominator*f.numerator];
    [self setDenominator:self.denominator * f.denominator];
}

@end
