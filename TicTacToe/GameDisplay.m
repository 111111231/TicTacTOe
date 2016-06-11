//
//  GameDisplay.m
//  TicTacToe
//
//  Created by Muzzammil on 30/05/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import "GameDisplay.h"
#import "AIMove.h"
typedef enum
{
    NO_VALUE = 0,
    X_VALUE = 1 ,
    O_VALUE = 2
    
} MOVES;

typedef enum
{
    ai_player = 1,
    human_player = 2,
    tiePlayer = 3,
    noPlayer = -1
    
} PLAYER;
@interface GameDisplay (){
    int turnOf;
    Details *details;
    PLAYER currentPlayer;
    int board[3][3];
    MOVES xmove;
    MOVES omove;
    MOVES noMove;
}
@end

@implementation GameDisplay

- (void)viewDidLoad {
    turnOf = -1;
    currentPlayer = noPlayer;
    details = [[Details alloc]init];
    currentPlayer = noPlayer;
    
    xmove = X_VALUE;
   
    omove = O_VALUE;
    
    noMove = NO_VALUE;
    board[0][0] =noMove;
    board[0][1] =noMove;
    board[0][2] =noMove;
    board[1][0] =noMove;
    board[1][1] =noMove;
    board[1][2] =noMove;
    board[2][0] =noMove;
    board[2][1] =noMove;
    board[2][2] =noMove;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)systemTag:(int)systemTag playerTag:(int)playerTag{
    [details systemObject:systemTag playerObject:playerTag];
}

- (IBAction)OnSelect:(id)sender {
    int rv1 = [self checkVictory:board];
    if(rv1 == ai_player){
        NSLog(@"AI Won");
        return;
    }
    else if (rv1 == human_player){
        NSLog(@"Human Won");
        return;
        
    }
    else if(rv1 == tiePlayer){
        NSLog(@"Tie");
        return;
    }
    UIButton *select = (UIButton*)sender;
    int tag = (int)select.tag;
    int index = [ModelController indexOfCell:tag];
    if(board[[ModelController indexOfButton:tag].x][[ModelController indexOfButton:tag].y]!=noMove) return;
  
   
    if(currentPlayer == noPlayer || currentPlayer == ai_player) currentPlayer = human_player;
    else currentPlayer = ai_player;
    
   // [details cellIndex:index turnOf:turnOf];

//AIMove*  a = [self getBestMove:board with:ai_player];
    AIMove* a = [[AIMove alloc]init];
    
    if(currentPlayer == human_player){
        
      
        a.x = [ModelController indexOfButton:tag].x;
        a.y = [ModelController indexOfButton:tag].y;
        [select setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        board[a.x][a.y]= omove;
        int rv = [self checkVictory:board];
        if(rv == ai_player){
            NSLog(@"AI Won");
            return;
        }
        else if (rv == human_player){
            NSLog(@"Human Won");
            return;

        }
        else if(rv == tiePlayer){
            NSLog(@"Tie");
            return;
        }
        currentPlayer = ai_player;
        a = [self getBestMove:board with:ai_player];
        int tagTemp = [ModelController getTag:a];
        UIButton *random = (UIButton *)[self.view viewWithTag:tagTemp];
    [random setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        board[a.x][a.y]= xmove;
        int rv2 = [self checkVictory:board];
        if(rv2 == ai_player){
            NSLog(@"AI Won");
            return;
        }
        else if (rv2 == human_player){
            NSLog(@"Human Won");
            return;
            
        }
        else if(rv2 == tiePlayer){
            NSLog(@"Tie");
            return;
        }
        
    }
    
    
  //  NSLog(@"%ld",(long)Action.tag);
 //   Action.titleLabel.numberOfLines = 1;
 //   Action.titleLabel.adjustsFontSizeToFitWidth = YES;
 //   Action.titleLabel.lineBreakMode = NSLineBreakByClipping;
  //  if(isSe){isSe=false;
  //      [Action setTitle:@"X" forState:UIControlStateNormal];
//}
  //  else{isSe=true;
   // [Action setTitle:@"O" forState:UIControlStateNormal];
//    }
    
    
 //   Action.enabled= NO;
    
  //  int k = [ModelController indexOfButton:90];
}

-(void)updateTitleOfTurn{
    if( turnOf == [details getPlayerObject])
        turnOf = [details getSystemObject];
    else if( turnOf == [details getSystemObject])
        turnOf = [details getPlayerObject];
}

-(void)drawTitle:(int)xy{
    int tag = [ModelController tagOfCell:xy];
    NSString* title = [ModelController titleOfCell:turnOf];
    UIButton *cell = (UIButton *)[self.view viewWithTag:tag];
    cell.titleLabel.numberOfLines = 1;
    cell.titleLabel.adjustsFontSizeToFitWidth = YES;
    cell.titleLabel.lineBreakMode = NSLineBreakByClipping;
    [cell setTitle:title forState:UIControlStateNormal];
    [self updateTitleOfTurn];
    cell.enabled= NO;
}

-(int)checkVictory:(int [3][3])board{
    //Seeing Vertical
    bool victory;
    int c;
    // Check the rows
    for (int y = 0; y < 3; y++) {
        c = board[0][y];
        if (c != NO_VALUE) {
            victory = true;
            for (int x = 0; x < 3; x++) {
                if (board[x][y] != c) {
                    victory = false;
                    break;
                }
            }
            if (victory) return c;
        }
    }
    
    // Check the columns
    for (int x = 0; x < 3; x++) {
        c = board[x][0];
        if (c != NO_VALUE) {
            victory = true;
            for (int y = 0; y < 3; y++) {
                if (board[x][y] != c) {
                    victory = false;
                    break;
                }
            }
            if (victory) return c;
        }
    }
    
    // Check top left diagonal
    c = board[0][0];
    if (c != NO_VALUE) {
        victory = true;
        for (int xy = 0; xy < 3; xy++) {
            if (board[xy][xy] != c) {
                victory = false;
                break;
            }
        }
        if (victory) return c;
    }
    
    // Check top right diagonal
    c = board[3 - 1][0];
    if (c != NO_VALUE) {
        victory = true;
        for (int xy = 0; xy < 3; xy++) {
            if (board[3 - xy - 1][xy] != c) {
                victory = false;
                break;
            }
        }
        if (victory) return c;
    }
    
    // Check for tie game
    for (int i = 0; i < 3; i++) {
        
        for(int j=0;j<3;j++){
            if (board[i][j] == NO_VALUE)
                return NO_VALUE;
        }
        
    }
    // If we get here, every spot was filled, so return tie
    return tiePlayer;
}

-(AIMove*)getBestMove:(int [3][3])board with:(int)player{
    
    int rv = [self checkVictory:board];
    if(rv == ai_player){
        return [[AIMove alloc]initWithSize:100];
    }
    else if (rv == human_player){
        return [[AIMove alloc]initWithSize:-100];
    }
    else if(rv == tiePlayer){
        return [[AIMove alloc]initWithSize:0];
    }
    
    NSMutableArray* moves = [[NSMutableArray alloc]init];
    for(int x =0;x<3;x++){
        for(int y= 0;y<3;y++){
            if(board[x][y] == NO_VALUE){
                AIMove* move =[AIMove alloc];
                move.x = x;
                move.y = y;
                board[x][y] = player;
                if(player == ai_player){
                    move.size = [[self getBestMove:board with:human_player] size];
                }
                else{
                    move.size = [[self getBestMove:board with:ai_player] size];
                }
                move.size = move.size -1;
                [moves addObject:move];
                board[x][y] = NO_VALUE;
            }
            
        }
        
    }
    
    int bestMove = 0;
    if(player == ai_player){
        int bestScore = -1000000;
        for(int i =0;i<moves.count;i++){
            AIMove* movetemp = [moves objectAtIndex:i];
            if(movetemp.size > bestScore){
                bestMove = i ;
                bestScore = movetemp.size;
            }
        }
    }
    else{
        int bestScore = 1000000;
        for(int i =0;i<moves.count;i++){
            AIMove* movetemp = [moves objectAtIndex:i];
            if(movetemp.size < bestScore){
                bestMove = i ;
                bestScore = movetemp.size;
            }
        }
    }
    return moves[bestMove];
}
@end
