//
//  MELViewControllerPerfil.m
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerPerfil.h"
#import "MELViewControllerMenu.h"

@interface MELViewControllerPerfil ()

@end

@implementation MELViewControllerPerfil

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}

- (IBAction)botaoVoltar:(id)sender {
    [self salvarNick];

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
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];

    _editarNick.text = [array objectAtIndex:0];
    _acertosHerois.text = [array objectAtIndex:1];
    _acertosViloes.text = [array objectAtIndex:2];
    _errosViloes.text = [array objectAtIndex:3];
    _errosHerois.text = [array objectAtIndex:4];
    _score.text = [array objectAtIndex:5];
    _totalPerguntas.text = [array objectAtIndex:6];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_editarNick resignFirstResponder];
}

-(void)salvarNick{
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
//    [array insertObject:_editarNick.text atIndex:0];
    [array replaceObjectAtIndex:0 withObject:_editarNick.text];
    [array writeToFile:[self caminhoPerfil] atomically:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
