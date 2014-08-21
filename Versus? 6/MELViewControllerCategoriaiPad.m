//
//  MELViewControllerCategoriaiPad.m
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerCategoriaiPad.h"
#import "MELViewControllerMenuiPad.h"
#import "MELViewControllerViloesiPad.h"
#import "MELViewControllerHeroisiPad.h"

@interface MELViewControllerCategoriaiPad ()

@end

@implementation MELViewControllerCategoriaiPad

- (IBAction)BotaoVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BotaoHeroi:(id)sender {
    MELViewControllerHeroisiPad *vilao = [[MELViewControllerHeroisiPad alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];

}

- (IBAction)BotaoVilao:(id)sender {
    MELViewControllerViloesiPad *vilao = [[MELViewControllerViloesiPad alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];
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
