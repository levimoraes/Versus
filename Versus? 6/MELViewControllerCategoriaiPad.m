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
@property (nonatomic) NSMutableArray *ordemPerg;
@end

@implementation MELViewControllerCategoriaiPad

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

- (IBAction)BotaoVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BotaoHeroi:(id)sender {
    [self zerarScore];
    
    NSMutableArray *plistPerfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    [plistPerfil insertObject:@"3" atIndex:8];
    [plistPerfil writeToFile:[self caminhoPerfil] atomically:YES];
    
    MELViewControllerHeroisiPad *heroi = [[MELViewControllerHeroisiPad alloc]init];
    [self sortearHerois];
    [self presentViewController:heroi animated:YES completion:nil];

}

- (IBAction)BotaoVilao:(id)sender {
    [self sortearViloes];
    MELViewControllerViloesiPad *vilao = [[MELViewControllerViloesiPad alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];
}

-(void)zerarScore{
    NSString *score = [NSString stringWithFormat:@"0"];
    NSMutableArray *perfil = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    [perfil insertObject:score atIndex:5];
    [perfil writeToFile:[self caminhoPerfil] atomically:YES];
}

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
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
