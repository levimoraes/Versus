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

-(void)sortearHerois{
    NSMutableArray *perguntas = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoHerois]];
    
    _ordemPerg = [[NSMutableArray alloc]init];
    while (_ordemPerg.count < perguntas.count) {
        int randomNumber = 1 + arc4random() % perguntas.count;
        if (![_ordemPerg containsObject:[NSString stringWithFormat:@"%d",randomNumber]])       {
            [_ordemPerg addObject:[NSString stringWithFormat:@"%d",randomNumber]];
        }
        continue;
    }
    
    [_ordemPerg writeToFile:[self caminhoOrdem] atomically:YES];
}

- (IBAction)BotaoVilao:(id)sender {
    MELViewControllerViloes *vilao = [[MELViewControllerViloes alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];
}
- (IBAction)BotaoHeroi:(id)sender {
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [self sortearHerois];
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
