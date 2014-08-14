//
//  MELViewControllerMenu.m
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerMenu.h"
#import "MELViewControllerCategoria.h"
#import "MELViewControllerPerfil.h"

@interface MELViewControllerMenu ()

@end

@implementation MELViewControllerMenu

- (IBAction)BotaoPerfil:(id)sender {
    MELViewControllerPerfil *perfil = [[MELViewControllerPerfil alloc]init];
    [self presentViewController:perfil animated:YES completion:nil];
}

- (IBAction)BotaoJogar:(id)sender {
    MELViewControllerCategoria *categoria = [[MELViewControllerCategoria alloc]init];
    [self presentViewController:categoria animated:YES completion:nil];
}

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}

-(IBAction)ligarMusica:(id)sender{
//Musica | 1 = ON 0 = OFF

    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    
    _musica = [array objectAtIndex:7];

    if([_musica isEqualToString:@"1"]){
        _musica = @"0";
        //[audioPlayer1 stop];
    }else{
        _musica = @"1";
        //[audioPlayer1 play];
    }
    
    [array insertObject:_musica atIndex:7];
    [array writeToFile:[self caminhoPerfil] atomically:YES];

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
    
    NSMutableArray *testePlistArray = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    if(testePlistArray == nil){
        
        NSMutableArray *testePlistArray = [[NSMutableArray alloc]init];
        
        [testePlistArray insertObject:@"Player" atIndex:0];
        [testePlistArray insertObject:@"0" atIndex:1];
        [testePlistArray insertObject:@"0" atIndex:2];
        [testePlistArray insertObject:@"0" atIndex:3];
        [testePlistArray insertObject:@"0" atIndex:4];
        [testePlistArray insertObject:@"0" atIndex:5];
        [testePlistArray insertObject:@"0" atIndex:6];
        [testePlistArray insertObject:@"0" atIndex:7];
        
        [testePlistArray writeToFile:[self caminhoPerfil] atomically:YES];
        
        NSLog(@"%@",[self caminhoPerfil]);
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
