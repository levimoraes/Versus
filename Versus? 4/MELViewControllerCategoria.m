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

@end

@implementation MELViewControllerCategoria
- (IBAction)BotaoVilao:(id)sender {
    [audioPlayer2 stop];
    MELViewControllerViloes *vilao = [[MELViewControllerViloes alloc]init];
    [self presentViewController:vilao animated:YES completion:nil];
}
- (IBAction)BotaoHeroi:(id)sender {
    [audioPlayer2 stop];
    MELViewControllerHerois *heroi = [[MELViewControllerHerois alloc]init];
    [self presentViewController:heroi animated:YES completion:nil];
}
- (IBAction)BotaoVoltar:(id)sender {
    [audioPlayer2 stop];
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
    NSString *music = [[NSBundle mainBundle]pathForResource:@"music" ofType:@"m4a"];
    audioPlayer2 = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer2.delegate= self;
    audioPlayer2.numberOfLoops = -1;
    [audioPlayer2 play];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
