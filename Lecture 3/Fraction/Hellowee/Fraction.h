//
//  Fraction.h
//  Hellowee
//
//  Created by Rakhim Davletkaliyev on 12-10-23.
//  Copyright (c) 2012 IITU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "numbersProtocol.h"

@interface Fraction : NSObject <numbersProtocol>

@property int numerator, denominator;

@end
