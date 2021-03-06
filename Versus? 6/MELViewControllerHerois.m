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
@property (nonatomic) UIRefreshControl *refreshControl;
@end

@implementation MELViewControllerHerois

int tempo = 10;
//NSTimer *timer2;

AVAudioPlayer *music;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        
//        NSURL *musicFile;
//        musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"heroi" ofType:@"m4a"]];
//        music = [[AVAudioPlayer alloc]initWithContentsOfURL:musicFile error:nil];
//        music.volume = 0.5;
//        music.numberOfLoops=10;
//        [music play];
        
    }
    return self;
}


-(NSString*)caminhoOrdem
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/ordem.plist",documentsDirectory];
    
    return fileName;
}
-(NSString*)caminhoHerois
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *caminho = [pathStr stringByAppendingPathComponent:@"herois.plist"];
    return caminho;
}

-(void)Desistir
{
    MELViewControllerMenu *menu = [[MELViewControllerMenu alloc]init];
    
    NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    NSString *pontosPlist = [plistPerfil objectAtIndex:5];
    NSString *valorNaPlist = [plistPerfil objectAtIndex:7];
    
    
    if ([valorNaPlist intValue] < [pontosPlist intValue]) {
        [plistPerfil replaceObjectAtIndex:7 withObject:pontosPlist];
        
    }
    [plistPerfil replaceObjectAtIndex:5 withObject:@"0"];
    
    [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
    
    [menu setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:menu animated:YES completion:nil];
    
}

- (IBAction)opcao1:(id)sender {
    [_opcao1 setEnabled:NO];
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao1.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    if ([change isEqualToString:@"1"]){
        
        [_opcao1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        //Pontuação
        
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        NSString *vidasPlist =[plistPerfil objectAtIndex:8];
        
        int pontos = [pontosPlist intValue];
        pontos += 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *acertos = [plistPerfil objectAtIndex:1];
        int acerto = [acertos intValue];
        acerto++;
        acertos = [NSString stringWithFormat:@"%d",acerto];
        
        [plistPerfil replaceObjectAtIndex:1 withObject:acertos];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
    }else{
        
        [_opcao1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        NSString *vidasPlist =[plistPerfil objectAtIndex:8];
        
        int pontos = [pontosPlist intValue];
        int vidas = [vidasPlist intValue];
        
        if (vidas-1<0) {
            [self Desistir];
        }
        else{
            vidas--;
            vidasPlist = [NSString stringWithFormat:@"%d",vidas];
            [plistPerfil replaceObjectAtIndex:8 withObject:vidasPlist];
            [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        }
        pontos -= 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *erros = [plistPerfil objectAtIndex:4];
        int erro = [erros intValue];
        erro++;
        erros = [NSString stringWithFormat:@"%d",erro];
        
        [plistPerfil replaceObjectAtIndex:4 withObject:erros];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao2:(id)sender {
    [_opcao2 setEnabled:NO];
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao2.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao1 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        int pontos = [pontosPlist intValue];
        pontos += 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *acertos = [plistPerfil objectAtIndex:1];
        int acerto = [acertos intValue];
        acerto++;
        acertos = [NSString stringWithFormat:@"%d",acerto];
        
        [plistPerfil replaceObjectAtIndex:1 withObject:acertos];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
        
    }else{
        
        [_opcao2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao1 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        NSString *vidasPlist =[plistPerfil objectAtIndex:8];
        
        int pontos = [pontosPlist intValue];
        int vidas = [vidasPlist intValue];
        
        if (vidas-1<0) {
            [self Desistir];
        }
        else{
            vidas--;
            vidasPlist = [NSString stringWithFormat:@"%d",vidas];
            [plistPerfil replaceObjectAtIndex:8 withObject:vidasPlist];
            [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        }
        pontos -= 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *erros = [plistPerfil objectAtIndex:4];
        int erro = [erros intValue];
        erro++;
        erros = [NSString stringWithFormat:@"%d",erro];
        
        [plistPerfil replaceObjectAtIndex:4 withObject:erros];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao3:(id)sender {
    [_opcao3 setEnabled:NO];
    
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao3.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao1 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        int pontos = [pontosPlist intValue];
        pontos += 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *acertos = [plistPerfil objectAtIndex:1];
        int acerto = [acertos intValue];
        acerto++;
        acertos = [NSString stringWithFormat:@"%d",acerto];
        
        [plistPerfil replaceObjectAtIndex:1 withObject:acertos];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
        
    }else{
        
        [_opcao3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao1 setHidden:YES];
        [_opcao4 setHidden:YES];
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        NSString *vidasPlist =[plistPerfil objectAtIndex:8];
        
        int pontos = [pontosPlist intValue];
        int vidas = [vidasPlist intValue];
        
        if (vidas-1<0) {
            [self Desistir];
        }
        else{
            vidas--;
            vidasPlist = [NSString stringWithFormat:@"%d",vidas];
            [plistPerfil replaceObjectAtIndex:8 withObject:vidasPlist];
            [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        }
        pontos -= 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *erros = [plistPerfil objectAtIndex:4];
        int erro = [erros intValue];
        erro++;
        erros = [NSString stringWithFormat:@"%d",erro];
        
        [plistPerfil replaceObjectAtIndex:4 withObject:erros];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
    }
    
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];

}

- (IBAction)opcao4:(id)sender {
    
    [_opcao4 setEnabled:NO];
    NSArray *pergunta = [[NSArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    NSString *resposta1 = _opcao4.titleLabel.text;
    NSArray *array = [questoes allKeysForObject:resposta1];
    
    NSString *change =[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    
    if ([change isEqualToString:@"1"]){
        
        [_opcao4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao1 setHidden:YES];
        
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        int pontos = [pontosPlist intValue];
        pontos += 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *acertos = [plistPerfil objectAtIndex:1];
        int acerto = [acertos intValue];
        acerto++;
        acertos = [NSString stringWithFormat:@"%d",acerto];
        
        [plistPerfil replaceObjectAtIndex:1 withObject:acertos];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
        
    }else{
        
        [_opcao4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_opcao2 setHidden:YES];
        [_opcao3 setHidden:YES];
        [_opcao1 setHidden:YES];
        
        //Pontuação
        NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *pontosPlist = [plistPerfil objectAtIndex:5];
        NSString *vidasPlist =[plistPerfil objectAtIndex:8];
        
        int pontos = [pontosPlist intValue];
        int vidas = [vidasPlist intValue];
        
        if (vidas-1<0) {
            [self Desistir];
        }
        else{
            vidas--;
            vidasPlist = [NSString stringWithFormat:@"%d",vidas];
            [plistPerfil replaceObjectAtIndex:8 withObject:vidasPlist];
            [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        }
        pontos -= 10;
        pontosPlist = [NSString stringWithFormat:@"%d",pontos];
        
        NSString *erros = [plistPerfil objectAtIndex:4];
        int erro = [erros intValue];
        erro++;
        erros = [NSString stringWithFormat:@"%d",erro];
        
        [plistPerfil replaceObjectAtIndex:4 withObject:erros];
        [plistPerfil replaceObjectAtIndex:5 withObject:pontosPlist];
        [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
        
        _labelScore.text = pontosPlist;
        
    }
    [self performSelector:@selector(proximaPergunta) withObject:nil afterDelay:0.5];
}

-(void)viewDidDisappear:(BOOL)animated{

}

-(void)viewWillDisappear:(BOOL)animated{

}

- (void)viewDidLoad
{
    
    NSLog(@"View");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
    [self pegarPerguntaAleatoria];
    [self sortearKey];
    
    NSMutableArray *pergunta = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    NSDictionary *questoes = [[NSDictionary alloc]initWithDictionary:[pergunta objectAtIndex:_nroQuestao]];
    
    _labelPergunta.text = [questoes objectForKey:@"Pergunta"];
    [_opcao1 setTitle:[questoes objectForKey:_key1] forState:UIControlStateNormal];
    [_opcao2 setTitle:[questoes objectForKey:_key2] forState:UIControlStateNormal];
    [_opcao3 setTitle:[questoes objectForKey:_key3] forState:UIControlStateNormal];
    [_opcao4 setTitle:[questoes objectForKey:_key4] forState:UIControlStateNormal];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tempo) userInfo:nil repeats:YES];
    
    NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    
    _labelScore.text = [plistPerfil objectAtIndex:5];
    _labelVidas.text = [plistPerfil objectAtIndex:8];
    
}

-(void)timer
{
    tempo--;
    
    if(tempo <= 0){
        tempo = nil;
        tempo = 10;
    }
        
    NSString *tempoStr = [[NSString alloc] initWithFormat:@"%d",tempo];
    _labelTempo.text = tempoStr;
}

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}

-(void)pegarPerguntaAleatoria{
    NSMutableArray *nros = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoOrdem]];
    
    _nroQuestao = [[nros objectAtIndex:0] intValue];
    
    [nros addObject:[nros objectAtIndex:0]];
    [nros removeObjectAtIndex:0];
    
    [nros writeToFile:[self caminhoOrdem] atomically:YES];
    
    NSLog(@"Questão = %i",_nroQuestao);
}

-(void)proximaPergunta{
    _barraTempo = NULL;
    tempo = nil;
    tempo = 10;
    if([self.timer2 isValid]){
        [self.timer2 invalidate];
        self.timer2 = nil;
    }
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [heroi setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:heroi animated:YES completion:nil];
}

-(void)sortearKey{
    int i = arc4random() % 4;
    
    switch (i) {
        case 0:
            _key1 = @"1";
            _key2 = @"4";
            _key3 = @"2";
            _key4 = @"3";
            break;
            
        case 1:
            _key1 = @"3";
            _key2 = @"1";
            _key3 = @"4";
            _key4 = @"2";
            break;
            
        case 2:
            _key1 = @"2";
            _key2 = @"3";
            _key3 = @"1";
            _key4 = @"4";
            break;
            
        case 3:
            _key1 = @"4";
            _key2 = @"2";
            _key3 = @"3";
            _key4 = @"1";
            break;
            
        case 4:
            _key1 = @"4";
            _key2 = @"3";
            _key3 = @"1";
            _key4 = @"2";
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
    //Para teste
    //_barraTempo.progress += 0.1;
    
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
