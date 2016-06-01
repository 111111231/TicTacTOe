//
//  ModelController.m
//  TicTacToe
//
//  Created by Muzzammil on 01/06/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import "ModelController.h"

@implementation ModelController

+(int)indexOfCell:(int)tag{
    /*
     0 > 11
     1 > 22
     2 > 33
     3 > 44
     4 > 55
     5 > 66
     6 > 77
     7 > 88
     8 > 99
     
     0 | 1 | 2
     3 | 4 | 5
     6 | 7 | 8
     
     */
    switch (tag) {
        case 11:
            return 0;
            break;
        case 22:
            return 1;
            break;
        case 33:
            return 2;
            break;
        case 44:
            return 3;
            break;
        case 55:
            return 4;
            break;
        case 66:
            return 5;
            break;
        case 77:
            return 6;
            break;
        case 88:
            return 7;
            break;
        case 99:
            return 8;
            break;
        default:
            break;
    }
    return -1;
}

+(int)tagOfCell:(int)index{
    switch (index) {
        case 0:
            return 11;
            break;
        case 1:
            return 22;
            break;
        case 2:
            return 33;
            break;
        case 3:
            return 44;
            break;
        case 4:
            return 55;
            break;
        case 5:
            return 66;
            break;
        case 6:
            return 77;
            break;
        case 7:
            return 88;
            break;
        case 8:
            return 99;
            break;
        default:
            break;
    }
    return -1;
}

+(NSString*)titleOfCell:(int)selection{
    switch (selection) {
        case 0:
            return @"X";
            break;
        case 1:
            return @"O";
            break;
        default:
            break;
    }
    return @"";
}


@end
