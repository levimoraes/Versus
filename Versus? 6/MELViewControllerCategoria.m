//
//  MELViewControllerCategoria.m
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerCategoria.h"
#import "MELViewControllerMenu.h"
#import "MELViewControllerViloes.h"
#import "MELViewControllerHerois.h"

@interface MELViewControllerCategoria ()

@end

@implementation MELViewControllerCategoria
- (IBAction)BotaoVilao:(id)sender {
    MELViewControllerViloes *vilao = [[MELViewControllerViloes alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];
}
- (IBAction)BotaoHeroi:(id)sender {
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [self presentViewController:heroi animated:YES completion:nil];
}
- (IBAction)BotaoVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
