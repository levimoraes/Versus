//
//  MELViewControllerEscolha.m
//  Versus
//
//  Created by Levi Santos on 12/08/14.
//  Copyright (c) 2014 Eduardo Levi Marcos. All rights reserved.
//

#import "MELViewControllerEscolha.h"
#import "MELViewControllerPerguntasTeste.h"
#import "MELViewControllerPerguntasViloes.h"

@interface MELViewControllerEscolha ()

@end

@implementation MELViewControllerEscolha

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)escolhaHerois:(id)sender {
    MELViewControllerPerguntasTeste*p = [[MELViewControllerPerguntasTeste alloc]init];
    [self presentViewController:p animated:YES completion:nil];

}
- (IBAction)escolhaViloes:(id)sender {
    MELViewControllerPerguntasViloes *p = [[MELViewControllerPerguntasViloes alloc]init];
    [self presentViewController:p animated:YES completion:nil];

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
