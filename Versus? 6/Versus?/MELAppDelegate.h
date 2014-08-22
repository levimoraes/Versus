//
//  MELAppDelegate.h
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <GameKit/GameKit.h>

@interface MELAppDelegate : UIResponder <UIApplicationDelegate,GKGameCenterControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL gameCenterEnabled;
@property (nonatomic, strong) NSString *leaderboardIdentifier;
@property (nonatomic) int64_t score;
//@property (nonatomic, strong) CustomActionSheet *customActionSheet;

@end
