//
//  MELViewControllerViloes.h
//  Versus?
//
//  Created by Eduardo Alves on 12/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MELViewControllerViloes : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelTempo;
@property (weak, nonatomic) IBOutlet UILabel *labelVidas;
@property (weak, nonatomic) IBOutlet UIProgressView *barraTempo;
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) NSTimer *timer2;
@property (weak, nonatomic) IBOutlet UIButton *opcao4;
@property (weak, nonatomic) IBOutlet UIButton *opcao3;
@property (weak, nonatomic) IBOutlet UIButton *opcao2;
@property (weak, nonatomic) IBOutlet UIButton *opcao1;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelPergunta;
@property (nonatomic) int nroQuestao;
@property (nonatomic) NSString *key1;
@property (nonatomic) NSString *key2;
@property (nonatomic) NSString *key3;
@property (nonatomic) NSString *key4;
@end
