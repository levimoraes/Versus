//
//  MELViewControllerPerfil.h
//  Versus?
//
//  Created by Eduardo Alves on 14/08/14.
//  Copyright (c) 2014 Eduardo Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
//#import "CPDConstants.h"
//#import "CPDStockPriceStore.h"

@interface MELViewControllerPerfil : UIViewController <CPTPlotDataSource, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *zerarButton;
@property (weak, nonatomic) IBOutlet UILabel *score;
@end
