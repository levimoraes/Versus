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
    while (_ordemPerg.count < perguntas.count-1) {
        int randomNumber = arc4random() % perguntas.count-1;
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
    while (_ordemPerg.count < perguntas.count-1) {
        int randomNumber = arc4random() % perguntas.count-1;
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
    [self sortearHerois];
    MELViewControllerHeroisiPad *vilao = [[MELViewControllerHeroisiPad alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];

}

- (IBAction)BotaoVilao:(id)sender {
    [self sortearViloes];
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
