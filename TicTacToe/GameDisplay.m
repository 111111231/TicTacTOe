//
//  GameDisplay.m
//  TicTacToe
//
//  Created by Muzzammil on 30/05/2016.
//  Copyright © 2016 Muzzammil. All rights reserved.
//

#import "GameDisplay.h"

@interface GameDisplay (){
    BOOL isSe;
}
@end

@implementation GameDisplay

- (void)viewDidLoad {
    isSe = true;
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

- (IBAction)OnSelect:(id)sender {
    UIButton *Action = (UIButton*)sender;
    NSLog(@"%ld",(long)Action.tag);
    Action.titleLabel.numberOfLines = 1;
    Action.titleLabel.adjustsFontSizeToFitWidth = YES;
    Action.titleLabel.lineBreakMode = NSLineBreakByClipping;
    if(isSe){isSe=false;
        [Action setTitle:@"X" forState:UIControlStateNormal];}
    else{isSe=true;
    [Action setTitle:@"O" forState:UIControlStateNormal];
    }
    
    
    Action.enabled= NO;
}

@end
