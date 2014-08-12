//
//  MELViewControllerPerguntasTeste.h
//  Versus
//
//  Created by Levi Santos on 08/08/14.
//  Copyright (c) 2014 Eduardo Levi Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MELViewControllerPerguntasTeste : UIViewController{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UILabel *questionField;
@property (weak, nonatomic) IBOutlet UIButton *answer1;
@property (weak, nonatomic) IBOutlet UIButton *answer2;
@property (weak, nonatomic) IBOutlet UIButton *answer3;
@property (weak, nonatomic) IBOutlet UIButton *answer4;
@property (weak, nonatomic) IBOutlet UIButton *trocar;
@property (weak, nonatomic) IBOutlet UIProgressView *progressViewBar;


@property(nonatomic)NSDictionary *pergunta1;

@end
