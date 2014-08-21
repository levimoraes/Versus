//
//  MELViewControllerMenuiPad.m
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerMenuiPad.h"
#import "MELViewControllerCategoriaiPad.h"
#import "MELViewControllerPerfiliPad.h"

@interface MELViewControllerMenuiPad ()

@property (nonatomic) BOOL gameCenterEnabled;
@property (nonatomic, strong) NSString *leaderboardIdentifier;
@property (nonatomic) int64_t score;
//@property (nonatomic, strong) CustomActionSheet *customActionSheet;


-(void)authenticateLocalPlayer;
-(void)reportScore;

@end

@implementation MELViewControllerMenuiPad

- (IBAction)BotaoPerfil:(id)sender {
    MELViewControllerPerfiliPad *perfil = [[MELViewControllerPerfiliPad alloc]init];
    [self presentViewController:perfil animated:YES completion:nil];
}

- (IBAction)BotaoJogar:(id)sender {
    MELViewControllerCategoriaiPad *categoria = [[MELViewControllerCategoriaiPad alloc]init];
    [self presentViewController:categoria animated:YES completion:nil];
}

-(IBAction)BotaoRanking:(id)sender{
    [self authenticateLocalPlayer];
    
    
    [self reportScore];
    
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
                _gameCenterEnabled = YES;
                
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

-(void)reportScore{
    
    int is=0;
    while (is<3) {
        
        
        NSLog (@"Report Score");
        
        NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
        NSString *string = [NSString stringWithFormat:@"%@",[array objectAtIndex:5]];
        
        GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:_leaderboardIdentifier];
        _score = atoll([string UTF8String]);
        score.value = _score;
        
        
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            if (error != nil) {
                NSLog(@"Erro = %@", [error localizedDescription]);
            }
        }];
        is++;
    }
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
    
    [self authenticateLocalPlayer];
    
    
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
