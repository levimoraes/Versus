//
//  MELViewControllerMenuiPad.h
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface MELViewControllerMenuiPad : UIViewController <UIApplicationDelegate,GKGameCenterControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *rankingButton;
@property (weak, nonatomic) IBOutlet UIImageView *GC;

@end
