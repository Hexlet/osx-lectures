//
//  main.m
//  Hellowee
//
//  Created by Rakhim Davletkaliyev on 12-10-23.
//  Copyright (c) 2012 IITU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Fraction () {
    NSString *name;
}
    
-(void)add: (Fraction *)f;
@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Fraction *myFraction, *myFraction2;
        myFraction = [[Fraction alloc] init];
        myFraction2 = [[Fraction alloc] init];
        
        [myFraction setNumerator:10];
        [myFraction setDenominator:22];
        
        [myFraction2 setNumerator:5];
        [myFraction2 setDenominator:6];
        
        [myFraction add: myFraction2];
        
        NSLog(@"%@", myFraction);
    }
    return 0;


}