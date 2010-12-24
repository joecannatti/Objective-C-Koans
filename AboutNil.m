//
//  AboutNil.m
//  ObjectiveCKoans
//
//  Created by Joe Cannatti on 12/23/10.
//  Copyright 2010 Puppy Sound Software. All rights reserved.
//

#import "Kiwi.h"
#import "KoansIncludes.h"

SPEC_BEGIN(AboutNil)

describe(@"nil", ^{
  
  it(@"evaluates to false in conditionals", ^{
    [[NSObject shouldNot] receive:@selector(description)];    
    NSObject *panda = __;
    if(panda){
      [NSObject description];
    }
  });
  
});

SPEC_END
