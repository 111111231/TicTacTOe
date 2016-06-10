//
//  AIMove.h
//  20148Game
//
//  Created by Ali Akhtar on 5/29/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIMove : NSObject
@property(nonatomic,assign)int x;
@property(nonatomic,assign)int y;
@property(nonatomic,assign)int size;
- (instancetype)initWithSize:(int)sizeInstance;
@end
