//
//  MELViewControllerPerfil.m
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import "MELViewControllerPerfil.h"
#import "MELViewControllerMenu.h"

@interface MELViewControllerPerfil ()

@property (strong, nonatomic) IBOutlet CPTGraphHostingView *hostView;



@end

@implementation MELViewControllerPerfil

@synthesize hostView = hostView_;

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //inicializando o plot
    [self initPlot];
}

-(NSString*)caminhoPerfil
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/perfil.plist",documentsDirectory];
    
    return fileName;
}

- (IBAction)botaoVoltar:(id)sender {
    [self salvarNick];

    [self dismissViewControllerAnimated:YES completion:nil];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];

    _editarNick.text = [array objectAtIndex:0];
    _acertosHerois.text = [array objectAtIndex:1];
    _acertosViloes.text = [array objectAtIndex:2];
    _errosViloes.text = [array objectAtIndex:3];
    _errosHerois.text = [array objectAtIndex:4];
    _score.text = [array objectAtIndex:5];
    
    int total = [_acertosHerois.text intValue] + [_acertosViloes.text intValue] + [_errosHerois.text intValue] + [_errosViloes.text intValue];
    
    _totalPerguntas.text = [NSString stringWithFormat:@"%i",total];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_editarNick resignFirstResponder];
}

-(void)salvarNick{
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
//    [array insertObject:_editarNick.text atIndex:0];
    [array replaceObjectAtIndex:0 withObject:_editarNick.text];
    [array writeToFile:[self caminhoPerfil] atomically:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CHart behavior
-(void) initPlot{
    [self configureHost];
    [self configureGraph];
    [self configureChart];
    [self configureLegend];
}

-(void)configureHost{

}

-(void)configureGraph{

}
-(void)configureChart{

}

-(void)configureLegend{

}


#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 0;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    return 0;
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
    return nil;
}

-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index {
    return @"";
}

#pragma mark - UIActionSheetDelegate methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
}

@end
