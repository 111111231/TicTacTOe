//
//  GameDisplay.m
//  TicTacToe
//
//  Created by Muzzammil on 30/05/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import "GameDisplay.h"

@interface GameDisplay (){
    int turnOf;
    Details *details;
}
@end

@implementation GameDisplay

- (void)viewDidLoad {
    turnOf = -1;
    details = [[Details alloc]init];
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
    UIButton *select = (UIButton*)sender;
    int tag = (int)select.tag;
    int index = [ModelController indexOfCell:tag];
    [details cellIndex:index turnOf:turnOf];
    
    
    
    
    
    
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
@end
