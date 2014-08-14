//
//  MELViewControllerHerois.m
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerHerois.h"
#import "MELViewControllerMenu.h"

@interface MELViewControllerHerois ()

@end

@implementation MELViewControllerHerois

-(NSString*)caminhoHerois
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *caminho = [pathStr stringByAppendingPathComponent:@"herois.plist"];
    return caminho;
}

- (IBAction)BotaoDesistir:(id)sender {
    NSLog(@"Desistir");
    MELViewControllerMenu *menu = [[MELViewControllerMenu alloc]init];
    [menu setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:menu animated:YES completion:nil];
}

- (IBAction)opcao1:(id)sender {
    NSLog(@"Opcao 1");
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao1.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
    }else{
        
        [_opcao1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao2:(id)sender {
    NSLog(@"Opcao 2");
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao2.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao1 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
    }else{
        
        [_opcao2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao1 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao3:(id)sender {
    NSLog(@"Opcao 3");
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao3.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao1 setHidden:YES];
        [_opcao4 setHidden:YES];
        
    }else{
        
        [_opcao3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao1 setHidden:YES];
        [_opcao4 setHidden:YES];
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao4:(id)sender {
    NSLog(@"Opcao 4");
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao4.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    NSLog(@"%@",change);
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao1 setHidden:YES];
        
    }else{
        
        [_opcao4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao1 setHidden:YES];
        
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

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
    
    [self pegarPerguntaAleatoria];
    [self sortearKey];
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    _labelPergunta.text = [questoes objectForKey:@"Pergunta"];
    [_opcao1 setTitle:[questoes objectForKey:_key1] forState:UIControlStateNormal];
    [_opcao2 setTitle:[questoes objectForKey:_key2] forState:UIControlStateNormal];
    [_opcao3 setTitle:[questoes objectForKey:_key3] forState:UIControlStateNormal];
    [_opcao4 setTitle:[questoes objectForKey:_key4] forState:UIControlStateNormal];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tempo) userInfo:nil repeats:YES];
    
}

-(void)pegarPerguntaAleatoria{
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    
    int i = (int) [pergunta count];
    
    _nroQuestao = arc4random() % i;
}

-(void)proximaPergunta{
    
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [heroi setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:heroi animated:YES completion:nil];
}

-(void)sortearKey{
    int i = arc4random() % 4;
    
    switch (i) {
        case 1:
            _key1 = @"1";
            _key2 = @"4";
            _key3 = @"2";
            _key4 = @"3";
            break;
            
        case 2:
            _key1 = @"3";
            _key2 = @"1";
            _key3 = @"4";
            _key4 = @"2";
            break;
            
        case 3:
            _key1 = @"2";
            _key2 = @"3";
            _key3 = @"1";
            _key4 = @"4";
            break;
            
        case 4:
            _key1 = @"4";
            _key2 = @"2";
            _key3 = @"3";
            _key4 = @"1";
            break;
            
        default:
            _key1 = @"1";
            _key2 = @"2";
            _key3 = @"3";
            _key4 = @"4";
            break;
    }
    
}

-(void)tempo {
    _barraTempo.progress += 0.001;
    
    if (_barraTempo.progress == 1){
        [_timer invalidate];
        [_opcao1 setHidden:YES];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];
    }
}


@end
