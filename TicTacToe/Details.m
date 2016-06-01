//
//  Details.m
//  TicTacToe
//
//  Created by Muzzammil on 01/06/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import "Details.h"

@implementation Details

-(id)init{
    self = [super init];
    systemObject = -1;
    playerObject = -1;
//    totalUsedCells = @{ @"0" : [NSNumber numberWithInt:0],
//                        @"0" : [NSNumber numberWithInt:0],
//                        @"0" : [NSNumber numberWithInt:0],
//                        @"0" : [NSNumber numberWithInt:0],
//                        };
    

    NSMutableArray *objects = [NSMutableArray new];
    NSMutableArray *keys = [NSMutableArray new];
    for (int i = 0; i < 9; i++) {
        [objects addObject:[NSNumber numberWithInt:-1]];
        [keys addObject:[@(i) stringValue]];
    }
    
//    NSArray *objects = [NSArray arrayWithObjects:@"0", @"1", @"2",@"3", @"4", @"5",@"6", @"7", @"8", nil];
    
    totalUsedCells = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    systemUsedCells = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    playerUsedCells = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];

    return self;
}
-(void)systemObject:(int)sObject playerObject:(int)pObject{
    systemObject = sObject;
    playerObject = pObject;
}
-(int)getSystemObject{
    return systemObject;
}
-(int)getPlayerObject{
    return playerObject;
}
-(void)cellIndex:(int)cIndex turnOf:(int)turnOf{
   [totalUsedCells setObject:@"1" forKey:[NSNumber numberWithInt:cIndex]];
    if( turnOf == playerObject)
   [systemUsedCells setObject:[@(turnOf) stringValue] forKey:[NSNumber numberWithInt:cIndex]];
    else if( turnOf == systemObject)
   [playerUsedCells setObject:[@(turnOf) stringValue] forKey:[NSNumber numberWithInt:cIndex]];
}
@end
