//
//  MELViewControllerMenu.m
//  Versus
//
//  Created by Levi Santos on 12/08/14.
//  Copyright (c) 2014 Eduardo Levi Marcos. All rights reserved.
//

#import "MELViewControllerMenu.h"
#import "MELViewControllerEscolha.h";

@interface MELViewControllerMenu ()

@end

@implementation MELViewControllerMenu

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)jogarAction:(id)sender {
    
    MELViewControllerEscolha *p = [[MELViewControllerEscolha alloc]init];
    [self presentViewController:p animated:YES completion:nil];
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
