//
//  Fraction.m
//  Hellowee
//
//  Created by Rakhim Davletkaliyev on 12-10-23.
//  Copyright (c) 2012 IITU. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction 

-(void)add: (Fraction *) f {
    [self setNumerator: self.numerator*f.denominator + self.denominator*f.numerator];
    [self setDenominator:self.denominator * f.denominator];
}

-(void)doubleNumber {
    [self setNumerator: self.numerator * 2];
    [self setDenominator:self.denominator * 2];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%i/%i", _numerator, _denominator];
}

@end
