//
//  AboutAssertions.m
//  ObjectiveCKoans
//
//  Created by Curtis Schofield
//  Copyright 2011 BlazingCloud, Curtis J Schofield
//

#import "Kiwi.h"

SPEC_BEGIN(AboutRetain)

describe(@"Retain Assertions", ^{

    context(@"NSMutableString Retain", ^{
         __block NSMutableString *aString = NULL;
        
        beforeEach(^{
            aString = [[NSMutableString alloc] init];
        });
        
        it(@"starts with a retainCount value", ^{
            int actual_count = [aString retainCount];
            int expected_count = -1; // change this to the correct value
            [[theValue(actual_count) should] equal:theValue(expected_count)]; 
        });
        
        it(@"increments retainCount value according to the selector retain", ^{
            [aString retain];
            int actual_count = [aString retainCount];
            int expected_count = -2; // change this to the correct value
            [[theValue(actual_count) should] equal:theValue(expected_count)]; 
        });
        
        it(@"decriments retainCount on selector release", ^{ 
            
            [aString retain];
            [aString release];
            int actual_count = [aString retainCount];
            int expected_count = -1; // change this to the correct value
            [[theValue(actual_count) should] equal:theValue(expected_count)]; 
            
            
            [aString release];
            actual_count = [aString retainCount];
            expected_count = -1; // change this to the correct value
            [[theValue(actual_count) should] equal:theValue(expected_count)]; 
            
            //
            // Did you not get what you expected? Check this resource out.
            //
            // http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html
        });
        
    });
    
});

SPEC_END
