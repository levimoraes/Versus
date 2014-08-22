//
//  MELAppDelegate.m
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELAppDelegate.h"
#import "MELViewControllerMenu.h"
#import "MELViewControllerMenuiPad.h"




@implementation MELAppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        MELViewControllerMenuiPad *p = [[MELViewControllerMenuiPad alloc]init];
        self.window.rootViewController = p;
        
    }else{
        MELViewControllerMenu *p = [[MELViewControllerMenu alloc]init];
        self.window.rootViewController = p;
    }

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    NSLog(@"Entrou em Background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //[self authenticateLocalPlayer];
    
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)authenticateLocalPlayer
{
    NSLog(@"Authenticate Player");
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            //[self presentViewController:viewController animated:YES completion:nil];
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
    
//    [self presentViewController:gcViewController animated:YES completion:nil];
    
    
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

@end
