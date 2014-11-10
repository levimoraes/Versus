//
//  MELViewControllerGameOver.m
//  Versus?
//
//  Created by Marco on 10/11/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerGameOver.h"
#import "MELViewControllerMenu.h"

@interface MELViewControllerGameOver ()

@end

@implementation MELViewControllerGameOver

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)gameOver:(id)sender {
    MELViewControllerMenu *menu = [[MELViewControllerMenu alloc]init];
    [self presentViewController:menu animated: YES completion: nil];
}

@end
