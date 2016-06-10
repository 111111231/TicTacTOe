//
//  ModelController.h
//  TicTacToe
//
//  Created by Muzzammil on 01/06/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AIMove;

@interface ModelController : NSObject

+(int)indexOfCell:(int)tag;

+(int)tagOfCell:(int)index;

+(NSString*)titleOfCell:(int)selection;

+(AIMove*)indexOfButton:(int)tag;
+(int)getTag:(AIMove*)move;
@end
