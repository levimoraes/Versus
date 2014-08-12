//
//  MELViewControllerPerguntasViloes.m
//  Versus
//
//  Created by Levi Santos on 08/08/14.
//  Copyright (c) 2014 Eduardo Levi Marcos. All rights reserved.
//

#import "MELViewControllerPerguntasViloes.h"
#import "MELViewControllerPerguntasTeste.h"

@interface MELViewControllerPerguntasViloes ()

@end

@implementation MELViewControllerPerguntasViloes

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)alterar :(id)sender
{
    MELViewControllerPerguntasTeste *p = [[MELViewControllerPerguntasTeste alloc]init];
    [self presentViewController:p animated:YES completion:nil];
    
    
}

-(NSString*)caminhoHerois
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [pathStr stringByAppendingPathComponent:@"heroisPerguntas.plist"];
    return finalPath;
}

-(IBAction)teste1:(id)sender
{
    NSLog(@"Chamou a funcao");
    
    
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:0]];
    
    NSString *resposta1 = _answer1.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0] ];
    NSLog(@"%@",change);
    if ([change isEqualToString:@"1"]){
        
        
        
        
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Resposta Correta"
                                                         message:@""
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }
    
    else
    {
        UIAlertView * alert2 =[[UIAlertView alloc ] initWithTitle:@"Resposta Incorreta"
                                                          message:@""
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles: nil];
        [alert2 addButtonWithTitle:@"OK"];
        [alert2 show];
    }
}

-(IBAction)teste2:(id)sender
{
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:0]];
    
    NSString *resposta1 = _answer2.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0] ];
    NSLog(@"%@",change);
    
    
    if ([change isEqualToString:@"1"])
    {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Resposta Correta"
                                                         message:@""
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }
    
    else
    {
        UIAlertView * alert2 =[[UIAlertView alloc ] initWithTitle:@"Resposta Incorreta"
                                                          message:@""
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles: nil];
        [alert2 addButtonWithTitle:@"OK"];
        [alert2 show];
    }
}

-(IBAction)teste3:(id)sender
{
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:0]];
    
    NSString *resposta1 = _answer3.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0] ];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Resposta Correta"
                                                         message:@""
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }
    
    else
    {
        UIAlertView * alert2 =[[UIAlertView alloc ] initWithTitle:@"Resposta Incorreta"
                                                          message:@""
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles: nil];
        [alert2 addButtonWithTitle:@"OK"];
        [alert2 show];
    }
    
}

-(IBAction)teste4:(id)sender
{
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:0]];
    
    NSString *resposta1 = _answer4.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0] ];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        
        [_answer4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        
    }
    
    else
    {
        UIAlertView * alert2 =[[UIAlertView alloc ] initWithTitle:@"Resposta Incorreta"
                                                          message:@""
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles: nil];
        [alert2 addButtonWithTitle:@"OK"];
        [alert2 show];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"INICIOU");
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:0]];
    
    
    
    _questionField.text = [questoes objectForKey:@"Pergunta"];
    [_answer1 setTitle:[questoes objectForKey:@"4"] forState:UIControlStateNormal];
    [_answer2 setTitle:[questoes objectForKey:@"3"] forState:UIControlStateNormal];
    [_answer3 setTitle:[questoes objectForKey:@"2"] forState:UIControlStateNormal];
    [_answer4 setTitle:[questoes objectForKey:@"1"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
