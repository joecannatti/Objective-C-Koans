//
//  AboutNSArray.m
//  ObjectiveCKoans
//
//  Created by Joe Cannatti on 12/30/10.
//  Copyright 2010 Puppy Sound Software. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(AboutNSArray)

describe(@"NSArray", ^{
  
  it(@"can be created with no arguments and be empty", ^{
    NSArray *panda = [NSArray array];
    [[theValue([panda count]) should] equal:theValue(1)];
  });
  
  it(@"can be created with a nil terminated list of heterogeneous Objects", ^{
   NSArray *panda = [NSArray arrayWithObjects:@"one",@"two", [NSNumber numberWithInt:3],nil];
    [[theValue([panda count]) should] equal:theValue(1)];
  });
    
});

SPEC_END
