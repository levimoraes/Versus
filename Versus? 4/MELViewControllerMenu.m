//
//  MELViewControllerMenu.m
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerMenu.h"
#import "MELViewControllerCategoria.h"

@interface MELViewControllerMenu ()

@end

@implementation MELViewControllerMenu

- (IBAction)BotaoJogar:(id)sender {
    [audioPlayer1 stop];
    MELViewControllerCategoria *categoria = [[MELViewControllerCategoria alloc]init];
    //[categoria setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:categoria animated:YES completion:nil];

}

-(NSString*)caminhoPerfil
{
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *caminho = [pathStr stringByAppendingPathComponent:@"perfil.plist"];
    return caminho;
}

-(IBAction)ligarMusica:(id)sender
{

//Musica | 1 = ON 0 = OFF


NSArray *array = [[NSArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[array objectAtIndex:0]];

_musica = [dict objectForKey:@"Musica"];

if([_musica isEqualToString:@"1"]){
    _musica = @"0";
}else{
    _musica = @"1";
}
    
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
    NSString *music = [[NSBundle mainBundle]pathForResource:@"music" ofType:@"m4a"];
    audioPlayer1 = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer1.delegate= self;
    audioPlayer1.numberOfLoops = -1;
    [audioPlayer1 play];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
