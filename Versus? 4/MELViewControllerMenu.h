//
//  MELViewControllerMenu.h
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MELViewControllerMenu : UIViewController<UIApplicationDelegate,AVAudioPlayerDelegate>{
    AVAudioPlayer *audioPlayer1;
}
@property (weak, nonatomic) IBOutlet UIButton *music;
@property (nonatomic) NSString *musica;


@end
