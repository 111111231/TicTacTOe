//
//  Details.h
//  TicTacToe
//
//  Created by Muzzammil on 01/06/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Details : NSObject
{
    int systemObject;
    int playerObject;
    NSMutableDictionary *totalUsedCells;
    NSMutableDictionary *systemUsedCells;
    NSMutableDictionary *playerUsedCells;
}

-(id)init;

-(void)systemObject:(int)sObject playerObject:(int)pObject;

-(int)getSystemObject;

-(int)getPlayerObject;

-(void)cellIndex:(int)cIndex turnOf:(int)turnOf;

@end
