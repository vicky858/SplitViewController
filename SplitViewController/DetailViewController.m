//
//  DetailViewController.m
//  SplitViewController
//
//  Created by vignesh on 9/8/16.
//  Copyright © 2016 vignesh. All rights reserved.
//

#import "DetailViewController.h"
#import "SplitViewController-Bridging-Header.h"
#import "PatientDetails.h"
#import "DateValueFormatter.h"

@interface CubicLineSampleFillFormatter : NSObject <IChartFillFormatter>
{
}
@end

@implementation CubicLineSampleFillFormatter

- (CGFloat)getFillLinePositionWithDataSet:(LineChartDataSet *)dataSet dataProvider:(id<LineChartDataProvider>)dataProvider
{
    return -10.f;
}

@end

@interface DetailViewController () <ChartViewDelegate>

//@property (strong, nonatomic) IBOutlet PieChartView *pieChartView;
@property (strong, nonatomic) IBOutlet LineChartView *chartView;
@property (strong, nonatomic) UILabel *imgLbl;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setPatDetails:(PatientDetails*)newDetailItem {
    if (_patDetails != newDetailItem) {
        _patDetails = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.patDetails) {
        //PatientDetails *obj= (PatientDetails*)_detailItem;
         [_usrImg setImage:[UIImage imageNamed:_patDetails.usrImg]];
        [_imgLbl setText:_patDetails.usrName];
        [_usrName setText:_patDetails.usrName];
        [_gender setText:_patDetails.gender];
        [_age setText:_patDetails.age];
        [_mailId setText:_patDetails.mailId];
        [_primayContactNo setText:_patDetails.primayContactNo];
        [_secondaryContactNo setText:_patDetails.secondaryContactNo];
        [_language setText:_patDetails.language];
        [_financialClass setText:_patDetails.financialClass];
        [_financialPayer setText:_patDetails.financialPayer];
        [_nextAppointmentDate setText:_patDetails.nextAppointmentDate];
        [_appDocName setText:_patDetails.appDocName];
        [_lastAppDate setText:_patDetails.lastAppDate];
        [_lastVisit setText:_patDetails.lastVisit];
        [_transportation setText:_patDetails.transportation];
        [_refDoc setText:_patDetails.refDoc];
        [_lastSeenDoc setText:_patDetails.lastSeenDoc];
        [_LastVisitDocAdd setText:_patDetails.LastVisitDocAdd];
        [_diagonises setText:_patDetails.diagonises];
        [_diganosesDate setText:_patDetails.diganosesDate];
        [_allergies setText:_patDetails.allergies];
        [_perfPharmacy setText:_patDetails.perfPharmacy];
        _perfPharmacy.text = _patDetails.perfPharmacy;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    _usrImg.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(173.0f/255.0f) blue:(199.0f/255.0f) alpha:1.0];
    _usrImg.layer.masksToBounds = YES;
    _usrImg.layer.cornerRadius = 20.0;
    
    _imgLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, _usrImg.bounds.size.width-28, _usrImg.bounds.size.width, 28)];
    _imgLbl.backgroundColor = [UIColor colorWithRed:(178.0f/255.0f) green:(178.0f/255.0f) blue:(178.0f/255.0f) alpha:1.0];
    _imgLbl.textColor = [UIColor whiteColor];
    _imgLbl.textAlignment = NSTextAlignmentCenter;
    [_usrImg addSubview:_imgLbl];
    
    [self configureView];
    [self setUpLineChartView];
    [self populateChartData];
   
    //    [self setUpPieChartView];
//    [self populatePieChartData];
}
/*
-(void)setUpPieChartView{
    _pieChartView.delegate = self;
    
    
    _pieChartView.usePercentValuesEnabled = YES;
    _pieChartView.drawSlicesUnderHoleEnabled = NO;
    _pieChartView.holeRadiusPercent = 0.48;
    _pieChartView.transparentCircleRadiusPercent = 0.51;
    _pieChartView.descriptionText = @"";
    [_pieChartView setExtraOffsetsWithLeft:5.f top:10.f right:5.f bottom:5.f];
    
    _pieChartView.drawCenterTextEnabled = YES;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"Treatments\nby Category"];
    [centerText setAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:16.f],
                                NSParagraphStyleAttributeName: paragraphStyle
                                } range:NSMakeRange(0, centerText.length)];
    [centerText addAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:14.f],
                                NSForegroundColorAttributeName: UIColor.grayColor
                                } range:NSMakeRange(12, centerText.length - 12)];
    [centerText addAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:14.f],
                                NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]
                                } range:NSMakeRange(centerText.length - 12, 12)];
    _pieChartView.centerAttributedText = centerText;
    _pieChartView.holeColor = [UIColor whiteColor];//[UIColor colorWithRed:185/255.f green:89/255.f blue:95/255.f alpha:1.f];
    _pieChartView.drawHoleEnabled = YES;
    _pieChartView.rotationAngle = 0.0;
    _pieChartView.rotationEnabled = YES;
    _pieChartView.highlightPerTapEnabled = YES;
    
    
    ChartLegend *l = _pieChartView.legend;
    l.position = ChartLegendPositionBelowChartCenter;
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 0.0;
    l.yOffset = 0.0;
    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.f];
    
    // entry label styling
    _pieChartView.entryLabelColor = UIColor.blackColor;
    _pieChartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.f];
    
    [_pieChartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
}

-(void)populatePieChartData{
    double mult = 100;
    
    NSMutableArray *treatments = [[NSMutableArray alloc] init];
    [treatments addObject:@"BP"];
    [treatments addObject:@"Sugar"];
    [treatments addObject:@"Nuro"];
    [treatments addObject:@"Heart"];
    [treatments addObject:@"General"];
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
    for (int i = 0; i < 5; i++)
    {
        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:treatments[i % treatments.count]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@"Election Results"];
    dataSet.sliceSpace = 2.0;
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    //[colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    //[colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    //[colors addObjectsFromArray:ChartColorTemplates.liberty];
    //[colors addObjectsFromArray:ChartColorTemplates.pastel];
    //[colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.f]];
    [data setValueTextColor:UIColor.blackColor];
    
    _pieChartView.data = data;
    [_pieChartView highlightValues:nil];
}*/

-(void)setUpLineChartView{
    _chartView.delegate = self;
    
    _chartView.descriptionText = @"";
    _chartView.noDataTextDescription = @"You need to provide data for the chart.";
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = YES;
    _chartView.highlightPerDragEnabled = YES;
    
    _chartView.backgroundColor = UIColor.whiteColor;
    
    _chartView.legend.enabled = YES;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10.f];
    xAxis.labelTextColor = [UIColor colorWithRed:180/255.0 green:51/255.0 blue:36/255.0 alpha:1.0];
    xAxis.drawAxisLineEnabled = YES;
    xAxis.drawGridLinesEnabled = YES;
    xAxis.centerAxisLabelsEnabled = YES;
    xAxis.granularity = 3600.0;
    xAxis.valueFormatter = [[DateValueFormatter alloc] init];
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:12.f];
    leftAxis.labelTextColor = [UIColor colorWithRed:180/255.0 green:51/255.0 blue:36/255.0 alpha:1.0];
    leftAxis.drawGridLinesEnabled = YES;
    leftAxis.granularityEnabled = YES;
    leftAxis.axisMinimum = 0.0;
    leftAxis.axisMaximum = 170.0;
    leftAxis.yOffset = -9.0;
    leftAxis.labelTextColor = [UIColor colorWithRed:180/255.0 green:51/255.0 blue:36/255.0 alpha:1.0];
    
    _chartView.rightAxis.enabled = NO;
    
    _chartView.legend.form = ChartLegendFormLine;
    
   }

-(void)populateChartData{
    
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval hourSeconds = 3600.0;
    
    int count = 5;
    int range = 100;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    NSTimeInterval from = now - (count / 2.0) * hourSeconds;
    NSTimeInterval to = now + (count / 2.0) * hourSeconds;
    
    for (NSTimeInterval x = from; x < to; x += hourSeconds)
    {
        double y = arc4random_uniform(range) + 50;
        [values addObject:[[ChartDataEntry alloc] initWithX:x y:y]];
    }
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    //[colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    //[colors addObjectsFromArray:ChartColorTemplates.joyful];
    //[colors addObjectsFromArray:ChartColorTemplates.colorful];
    //[colors addObjectsFromArray:ChartColorTemplates.liberty];
    //[colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:54/255.f green:68/255.f blue:212/255.f alpha:1.f]];
    
    NSMutableArray *circleColor =[[NSMutableArray alloc]init];
//    [circleColor addObjectsFromArray:ChartColorTemplates.vordiplom];
//    [circleColor addObjectsFromArray:ChartColorTemplates.joyful];
//    [circleColor addObjectsFromArray:ChartColorTemplates.colorful];
//    [circleColor addObjectsFromArray:ChartColorTemplates.liberty];
//    [circleColor addObjectsFromArray:ChartColorTemplates.pastel];
    [circleColor addObject:[UIColor colorWithRed:101/255.f green:64/255.f blue:166/255.f alpha:1.f]];
    
    LineChartDataSet *set1 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
        set1.colors = colors;
        set1.values = values;
        set1.circleColors = circleColor;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
        set1.axisDependency = AxisDependencyLeft;
        set1.colors = colors;
        set1.valueTextColor = [UIColor colorWithRed:180/255.0 green:51/255.0 blue:36/255.0 alpha:1.0];
        set1.lineWidth = 1.5;
        set1.circleColors = circleColor;
        set1.drawCirclesEnabled = YES;
        set1.circleHoleColor = [UIColor grayColor];
        set1.drawValuesEnabled = YES;
        set1.fillAlpha = 1.0;
        set1.fillColor = [UIColor colorWithRed:51/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
        set1.highlightColor = [UIColor colorWithRed:214/255.0 green:69/255.0 blue:119/255.0 alpha:1.0];
        set1.drawCircleHoleEnabled = YES;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueTextColor:UIColor.blackColor];
        [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:9.0]];
        
        _chartView.data = data;
    }
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    //barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem
     setLeftBarButtonItem:barButtonItem animated:YES];
   
   // barButtonItem.title = NSLocalizedString(@"Favorite Web Sites", @"Favorite Web Sites");


}

- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view,
    // invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
   
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

@end
