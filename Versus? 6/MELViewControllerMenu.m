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
#import "CustomActionSheet.h"


@interface MELViewControllerMenu ()

@property (nonatomic) BOOL gameCenterEnabled;
@property (nonatomic, strong) NSString *leaderboardIdentifier;
@property (nonatomic) int64_t score;
@property (nonatomic) int64_t pergHeroi;
@property (nonatomic) int64_t pergVilao;
@property (nonatomic, strong) CustomActionSheet *customActionSheet;



-(void)authenticateLocalPlayer;
-(void)reportScore;
-(void)updateAchivements;

@end

@implementation MELViewControllerMenu

AVAudioPlayer *music;

- (IBAction)BotaoPerfil:(id)sender {
    MELViewControllerPerfil *perfil = [[MELViewControllerPerfil alloc]init];
    [self presentViewController:perfil animated:YES completion:nil];
}

- (IBAction)BotaoJogar:(id)sender {
//    [music st??op];
    MELViewControllerCategoria *categoria = [[MELViewControllerCategoria alloc]init];
    [self presentViewController:categoria animated:YES completion:nil];
}


-(void)authenticateLocalPlayer
{
    NSLog(@"Authenticate Player");
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        _leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                _gameCenterEnabled = NO;
            }
        }
    };
}

- (void) showLeaderboard: (NSString*) leaderboardID

{
    
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    
    if (gameCenterController != nil)
        
    {
        
        gameCenterController.gameCenterDelegate = self;
        
        gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
        
        [self presentViewController: gameCenterController animated: YES completion:nil];
        
    }
    
}

- (void) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent

{
    
    GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: identifier];
    
    if (achievement)
        
    {
        
        achievement.percentComplete = percent;
        
        [achievement reportAchievementWithCompletionHandler:^(NSError *error)
         
         {
             
             if (error != nil)
                 
             {
                 
                 NSLog(@"Error in reporting achievements: %@", error);
                 
             }
             
         }];
        
    }
    
}

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard
{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcViewController.leaderboardIdentifier = _leaderboardIdentifier;
    }
    else{
        gcViewController.viewState = GKGameCenterViewControllerStateAchievements;
    }
    
    [self presentViewController:gcViewController animated:YES completion:nil];
    
    
}

- (void) loadAchievements

{    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray *achievements, NSError *error) {
    
    if (error != nil)
        
    {
        
        // Handle the error.
        
    }
    
    if (achievements != nil)
        
    {
        
        // Process the array of achievements.
        
    }
    
}];
    
}



- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController

{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(IBAction)reportScore:(id)sender
{
    
    NSString *leaderboardId = @"melhoresResultadosHeroi";
    
    int is=0;
    while (is<3) {
        
        
        NSLog (@"Report Score");
        
        NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *string = [NSString stringWithFormat:@"%@",[array objectAtIndex:7]];
        
        GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardId];
        _score = atoll([string UTF8String]);
        score.value = _score;
        NSArray *newArray = [[NSArray alloc]initWithObjects:score, nil];
        
        GKScore *scorePerguntas = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardId];
        NSString *numeroPergHeroi = [NSString stringWithFormat:@"%@",[array objectAtIndex:1]];
        NSString *numeroPergVilao = [NSString stringWithFormat:@"%@",[array objectAtIndex:2]];
        
        
        _pergHeroi = atoll([numeroPergHeroi UTF8String]);
        _pergVilao = atoll([numeroPergVilao UTF8String]);
        
        
        /* --------------------   HEROIS  --------------------------------------- */
        
        
        //10 PERGUNTAS
        if (_pergHeroi >= 10){
            [self reportAchievementIdentifier:@"Achivements10perguntasHerois" percentComplete:100.00];
            
        }
        if (_pergHeroi <10){
            
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi*100/10];
            
            //   _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements10perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];        }
        
        
        //25 PERGUNTAS
        
        if (_pergHeroi >= 25){
            [self reportAchievementIdentifier:@"Achivements25perguntasHerois" percentComplete:100.0];
            
        }
        
        if (_pergHeroi < 25)
        {
            
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi*100/25];
            
            //   _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements25perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];
        }
        
        //50 PERGUNTAS
        
        if (_pergHeroi >= 50){
            [self reportAchievementIdentifier:@"Achivements50perguntasHerois" percentComplete:100.0];
            
        }
        
        if (_pergHeroi < 50)
        {
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi*100/50];
            
            //     _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements50perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];
        }
        
        
        //100 PERGUNTAS
        
        if (_pergHeroi >= 100){
            [self reportAchievementIdentifier:@"Achivements100perguntasHerois" percentComplete:100.0];
            
        }
        
        if (_pergHeroi < 100)
        {
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi];
            
            //    _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements100perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];
        }
        
        
        //500 PERGUNTAS
        
        if (_pergHeroi >= 500){
            [self reportAchievementIdentifier:@"Achivements500perguntasHerois" percentComplete:100.0];
            
        }
        
        if (_pergHeroi < 500)
        {
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi*1000/500];
            
            //    _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements500perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];
        }
        
        
        
        //1000 PERGUNTAS
        
        if (_pergHeroi >= 1000){
            [self reportAchievementIdentifier:@"Achivements1000perguntasHerois" percentComplete:100.0];
            
        }
        
        if (_pergHeroi < 1000)
        {
            float heroi = _pergHeroi;
            numeroPergHeroi = [NSString stringWithFormat:@"%.1f",heroi/10];
            
            //    _pergHeroi = atoll([numeroPergHeroi UTF8String]);
            [self reportAchievementIdentifier:@"Achivements1000perguntasHerois" percentComplete:[numeroPergHeroi floatValue]];
        }
        
        
        /*---------------------------- VILOES------------------------------------------*/
        
        
        //10 PERGUNTAS
        if (_pergVilao >= 10){
            [self reportAchievementIdentifier:@"Achivements10perguntasVilao" percentComplete:100.00];
            
        }
        if (_pergVilao <10){
            
            float vilao = _pergVilao;
            numeroPergVilao = [NSString stringWithFormat:@"%.1f",vilao*100/10];
            
            //_pergVilao = atoll([numeroPergVilao UTF8String]);
            [self reportAchievementIdentifier:@"Achivements10perguntasVilao" percentComplete:[numeroPergVilao floatValue]];        }
        
        //25 PERGUNTAS
        if (_pergVilao >= 25){
            [self reportAchievementIdentifier:@"Achivements25perguntasVilao" percentComplete:100.00];
            
        }
        if (_pergVilao <25){
            
            float vilao = _pergVilao;
            numeroPergVilao = [NSString stringWithFormat:@"%.1f",vilao*100/25];
            
            //_pergVilao = atoll([numeroPergVilao UTF8String]);
            [self reportAchievementIdentifier:@"Achivements25perguntasVilao" percentComplete:[numeroPergVilao floatValue]];        }
        
        //50 PERGUNTAS
        if (_pergVilao >= 50){
            [self reportAchievementIdentifier:@"Achivements50perguntasVilao" percentComplete:100.00];
            
        }
        if (_pergVilao <50){
            
            float vilao = _pergVilao;
            numeroPergVilao = [NSString stringWithFormat:@"%.1f",vilao*100/50];
            
            //_pergVilao = atoll([numeroPergVilao UTF8String]);
            [self reportAchievementIdentifier:@"Achivements50perguntasVilao" percentComplete:[numeroPergVilao floatValue]];        }
        
        //100 PERGUNTAS
        if (_pergVilao >= 100){
            [self reportAchievementIdentifier:@"Achivements100perguntasVilao" percentComplete:100.00];
            
        }
        if (_pergVilao <100){
            
            float vilao = _pergVilao;
            numeroPergVilao = [NSString stringWithFormat:@"%.1f",vilao];
            
            //_pergVilao = atoll([numeroPergVilao UTF8String]);
            [self reportAchievementIdentifier:@"Achivements100perguntasVilao" percentComplete:[numeroPergVilao floatValue]];        }
        
        //1000 PERGUNTAS
        if (_pergVilao >= 1000){
            [self reportAchievementIdentifier:@"Achivements1000perguntasVilao" percentComplete:100.00];
            
        }
        if (_pergVilao <1000){
            
            float vilao = _pergVilao;
            numeroPergVilao = [NSString stringWithFormat:@"%.1f",vilao/10];
            
            //_pergVilao = atoll([numeroPergVilao UTF8String]);
            [self reportAchievementIdentifier:@"Achivements1000perguntasVilao" percentComplete:[numeroPergVilao floatValue]];        }
        
        
        
        [GKScore reportScores:newArray withCompletionHandler:^(NSError *error) {
            if (error != nil) {
                NSLog(@"Erro = %@", [error localizedDescription]);
            }
        }];
        is++;
    }
    
    
    [self showLeaderboard:leaderboardId];
}
-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}



-(void)viewWillAppear:(BOOL)animated
{
    NSURL *musicFile;
    musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"musicaVersus" ofType:@"m4a"]];
    
    music = [[AVAudioPlayer alloc]initWithContentsOfURL:musicFile error:nil];
    music.volume = 0.5;
    music.numberOfLoops=10;
    [music play];

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
    
    
    
    [self authenticateLocalPlayer];
    
    GKLocalPlayer *localplayer = [GKLocalPlayer localPlayer];
    [localplayer authenticateWithCompletionHandler:^(NSError *error) {
        if (error) {
            NSLog(@"NAO CONECTADO");
            [_rankingButton setBackgroundImage:[UIImage imageNamed:@"GCSaturado.png"] forState:UIControlStateNormal];
            [_rankingButton setEnabled:NO];
        }
        else {
            NSLog(@"CONECTADO");
            [_rankingButton setBackgroundImage:[UIImage imageNamed:@"Game-Center2.png"] forState:UIControlStateNormal];
            [_rankingButton setEnabled:YES];
        }
    }];
    
    //animando a imagem de fundo do menu
    NSArray *imageNames = @[@"BGMenu.png", @"BGMenu2.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Slow motion animation
    UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:(self.view.frame)];
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 0.5;
    
    [self.view addSubview:slowAnimationImageView];
    [self.view sendSubviewToBack:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
    
    
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
