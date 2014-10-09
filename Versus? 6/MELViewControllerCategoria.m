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
@property (nonatomic) NSMutableArray *ordemPerg;
@end

@implementation MELViewControllerCategoria

AVAudioPlayer *music;

-(NSString*)caminhoHerois
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *caminho = [pathStr stringByAppendingPathComponent:@"herois.plist"];
    return caminho;
}

-(NSString*)caminhoOrdem
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/ordem.plist",documentsDirectory];
    
    return fileName;
}

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}

-(NSString*)caminhoVilao
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *caminho = [pathStr stringByAppendingPathComponent:@"viloes.plist"];
    return caminho;
}

-(void)sortearHerois{
    NSMutableArray *perguntas = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    
    _ordemPerg = [[NSMutableArray alloc]init];
    while (_ordemPerg.count < perguntas.count) {
        int randomNumber = arc4random() % perguntas.count;
        NSLog(@"%i",randomNumber);
        if (![_ordemPerg containsObject:[NSString stringWithFormat:@"%d",randomNumber]])       {
            [_ordemPerg addObject:[NSString stringWithFormat:@"%d",randomNumber]];
        }
        continue;
    }
    
    [_ordemPerg writeToFile:[self caminhoOrdem] atomically:YES];
}

-(void)sortearViloes{
    NSMutableArray *perguntas = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoVilao]];
    
    _ordemPerg = [[NSMutableArray alloc]init];
    while (_ordemPerg.count < perguntas.count) {
        int randomNumber = arc4random() % perguntas.count;
        if (![_ordemPerg containsObject:[NSString stringWithFormat:@"%d",randomNumber]])       {
            [_ordemPerg addObject:[NSString stringWithFormat:@"%d",randomNumber]];
        }
        continue;
    }
    
    [_ordemPerg writeToFile:[self caminhoOrdem] atomically:YES];
}

- (IBAction)BotaoVilao:(id)sender {
    [music stop];
    NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    [plistPerfil insertObject:@"3" atIndex:8];
    [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
    
    MELViewControllerViloes *vilao = [[MELViewControllerViloes alloc]init];
    [self sortearViloes];
    [self presentViewController:vilao animated:YES completion:nil];
}
- (IBAction)BotaoHeroi:(id)sender {
    [music stop];
    NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    [plistPerfil insertObject:@"3" atIndex:8];
    [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
    
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [self sortearHerois];
    [self presentViewController:heroi animated:YES completion:nil];
}
- (IBAction)BotaoVoltar:(id)sender {
    [music stop];
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

-(void)viewWillAppear:(BOOL)animated
{
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"categoria" ofType:@"m4a"]];
    
    music = [[AVAudioPlayer alloc]initWithContentsOfURL:musicFile error:nil];
    music.volume = 0.5;
    music.numberOfLoops=10;
    [music play];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
