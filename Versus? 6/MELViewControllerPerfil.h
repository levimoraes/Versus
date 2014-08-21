//
//  MELViewControllerPerfil.h
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MELViewControllerPerfil : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UITextField *editarNick;
@property (weak, nonatomic) IBOutlet UILabel *acertosViloes;
@property (weak, nonatomic) IBOutlet UILabel *acertosHerois;
@property (weak, nonatomic) IBOutlet UILabel *errosViloes;
@property (weak, nonatomic) IBOutlet UILabel *errosHerois;
@property (weak, nonatomic) IBOutlet UILabel *totalPerguntas;
@end
