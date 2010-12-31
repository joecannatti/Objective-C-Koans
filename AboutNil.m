//
//  AboutNil.m
//  ObjectiveCKoans
//
//  Created by Joe Cannatti on 12/23/10.
//  Copyright 2010 Puppy Sound Software. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(AboutNil)

describe(@"nil", ^{
  
  it(@"evaluates to false in conditionals", ^{
    [[NSObject shouldNot] receive:@selector(description)];    
    id panda = [NSObject new];
    if(panda){
      [NSObject description];
    }
  });
  
  it(@"should not raise an exception if sent a message", ^{
    [[theBlock(^{
      id panda = nil;
      [panda description];
    }) should] raise];
  });
  
});

SPEC_END
