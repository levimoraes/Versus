//
//  MELViewControllerMenu.h
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <AVFoundation/AVFoundation.h>


@interface MELViewControllerMenu : UIViewController<UIApplicationDelegate,GKGameCenterControllerDelegate>
@property (nonatomic) NSString *musica;
@property (weak, nonatomic) IBOutlet UIButton *rankingButton;
@property (weak, nonatomic) IBOutlet UIButton *botaoMusica;

-(void)authenticateLocalPlayer;
-(void)reportScore;
@end
