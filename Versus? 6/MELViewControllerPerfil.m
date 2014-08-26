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
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

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
   // [self salvarNick];

    MELViewControllerMenu *view = [[MELViewControllerMenu alloc]init];
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:view animated:YES completion:nil];

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
    _score.text = [array objectAtIndex:7];
    
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
    // 1 - Set up view frame
    CGRect parentRect = self.view.bounds;
//    CGSize toolbarSize = self.toolbar.bounds.size;
  //  parentRect = CGRectMake(parentRect.origin.x,
    //                        (parentRect.origin.y + toolbarSize.height),
      //                      parentRect.size.width,
        //                    (parentRect.size.height - toolbarSize.height));
    // 2 - Create host view
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:parentRect];
    self.hostView.allowPinchScaling = NO;
    [self.view addSubview:self.hostView];
}

-(void)configureGraph{
    // 1 - Create and initialize graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.axisSet = nil;
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor whiteColor];
    textStyle.fontName = @"Chalkboard SE";
    textStyle.fontSize = 20.0f;
    // 3 - Configure title
    NSString *title = @"Gráfico do seu progresso...";
    graph.title = title;
    graph.titleTextStyle = textStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);

}
-(void)configureChart{
    // 1 - Get reference to graph
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create chart
    CPTPieChart *pieChart = [[CPTPieChart alloc] init];
    pieChart.dataSource = self;
    pieChart.delegate = self;
    pieChart.pieRadius = (self.hostView.bounds.size.height * 0.5) / 2;
    pieChart.identifier = graph.title;
    pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionClockwise;
    // 3 - Create gradient
    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
    overlayGradient.gradientType = CPTGradientTypeRadial;
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.4] atPosition:1.0];
    pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];
    // 4 - Add chart to graph    
    [graph addPlot:pieChart];
}

-(void)configureLegend{

}


#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 4;

}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:[self caminhoPerfil]];
    
    switch (index) {
        case 0:
            return [[NSNumber alloc]initWithInt:[[array objectAtIndex:1] intValue]];
            break;
        case 1:
            return [[NSNumber alloc]initWithInt:[[array objectAtIndex:2] intValue]];
            break;
        case 2:
            return [[NSNumber alloc]initWithInt:[[array objectAtIndex:3] intValue]];
            break;
        case 3:
            return [[NSNumber alloc]initWithInt:[[array objectAtIndex:4] intValue]];
            break;
        default:
            return [NSDecimalNumber zero];
            break;
            }
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
