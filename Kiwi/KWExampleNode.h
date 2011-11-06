//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "KiwiConfiguration.h"

@protocol KWExampleNodeVisitor;

@protocol KWExampleNode<NSObject>

#pragma mark -
#pragma mark Accepting Visitors

- (void)acceptExampleNodeVisitor:(id<KWExampleNodeVisitor>)aVisitor;

@end
