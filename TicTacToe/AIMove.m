//
//  AIMove.m
//  20148Game
//
//  Created by Ali Akhtar on 5/29/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "AIMove.h"

@implementation AIMove
- (instancetype)initWithSize:(int)sizeInstance
{
    self = [super init];
    if (self) {
        self.size = sizeInstance;
    }
    return self;
}
@end
