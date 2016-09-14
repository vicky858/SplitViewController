//
//  MasterViewController.m
//  SplitViewController
//
//  Created by vignesh on 9/8/16.
//  Copyright © 2016 vignesh. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PatientDetails.h"
#import "MyTableViewCell.h"
#import "SQLiteManager.h"
#import "FMDatabase.h"


@interface MasterViewController ()
{
    PatientDetails *patientObj;
    NSMutableArray *bookArray;
    SQLiteManager *sqldb;
    NSDictionary *xmlDictionary;
    NSString *_databasePath;
    

    
}
@property NSMutableArray *objects;
//@property UIRefreshControl *refreshControl;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _patientList = [[NSMutableArray alloc]init];
    
    // Initialize the refresh control.
//    self.refreshControl = [[UIRefreshControl alloc] init];
//    self.refreshControl.backgroundColor = [UIColor purpleColor];
//    self.refreshControl.tintColor = [UIColor whiteColor];
//    [self.refreshControl addTarget:self
//                            action:@selector(getPatientDetails)
//                  forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:self.refreshControl];
    
    
        //_patientList = [[NSArray alloc] initWithObjects:@"Yahoo",@"Google",@"Apple",@"eBookFrenzy",nil];
    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Male1.jpg";
    patientObj.usrName = @"Peter";
    patientObj.gender = @"Male";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"peter@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];

    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Male2.jpg";
    patientObj.usrName = @"John";
    patientObj.gender = @"Male";
    patientObj.age = @"26 Years Old(06/08/1984)";
    patientObj.mailId= @"john@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];
    
    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Male3.jpg";
    patientObj.usrName = @"Anderson";
    patientObj.gender = @"Male";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"anderson@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];

    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Male4.jpg";
    patientObj.usrName = @"Thomas";
    patientObj.gender = @"Male";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"thomas@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];

    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Female1.jpeg";
    patientObj.usrName = @"Ana Gomez";
    patientObj.gender = @"Female";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"anagomez@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];

    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"Female2.jpg";
    patientObj.usrName = @"Jessi";
    patientObj.gender = @"Female";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"jessi@hotmail.com";
    patientObj.primayContactNo= @"9865777711";
    patientObj.secondaryContactNo= @"033-777711";
    patientObj.language=@"English";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficalVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Omega Pharmacy";
    [_patientList addObject:patientObj];


    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject]
     topViewController];
    
   
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self performSegueWithIdentifier:@"showDetail" sender:self];

}



-(void)DBInsert:(NSArray *)arrValue{
    NSLog(@"arr ::%@",arrValue);
    [self createDatabaseIfNeeded];
    
    if([_db open]){
        [_db executeUpdate:@"create table if not exists Events(eventName text, eventURL text)"];
        [_db close];
    }
    
    BOOL updaetStatus = NO;
    BOOL insertStatus = NO;
    for (NSDictionary *dic in arrValue) {
        if([self findEvent:dic]){
            updaetStatus = [self updateEvent:dic];
            NSLog(@"updaet Status : %d",updaetStatus);
        }else{
            insertStatus = [self insertEvent:dic];
            NSLog(@"insert Status : %d",insertStatus);
        }
    }
    
    
    
    
}


-(BOOL)findEvent:(NSDictionary*)obj{
    
    [_db open];
    FMResultSet *results = [_db executeQuery:@"SELECT * FROM Events where eventName= ?;",[obj objectForKey:@"@event"]];
    
    if([results next]) {
        [_db close];
        return YES;
    }
    [_db close];
    return NO;
}

-(BOOL)updateEvent:(NSDictionary*)obj{
    
    [_db open];
    return [_db executeUpdate:@"UPDATE Events set eventName= ?, eventURL=? where eventName= ?;", [obj objectForKey:@"@event"], [obj objectForKey:@"text"], [obj objectForKey:@"@event"]];
}

-(BOOL)insertEvent:(NSDictionary*)obj{
    [_db open];
    return [_db executeUpdate:@"INSERT INTO Events (eventName, eventURL) VALUES (?,?);", [obj objectForKey:@"@event"], [obj objectForKey:@"text"]];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(void)getPatientDetails{
    
    
    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"person-man.png";
    patientObj.usrName = [NSString stringWithFormat:@"Ana %i",_patientList.count];
    patientObj.gender = @"Female";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"Male";
    patientObj.primayContactNo= @"eamplame@exapmle.com";
    patientObj.secondaryContactNo= @"1234567";
    patientObj.language=@"9876554";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficeVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Address";
    [_patientList addObject:patientObj];
    [self performSelector:@selector(hideRefreshViewControl) withObject:nil afterDelay:3.0];
}

-(void)hideRefreshViewControl{
    
    [self.tableView reloadData];
    
    // End the refreshing
    if (self.refreshControl) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        
        [self.refreshControl endRefreshing];
    }
}
*/
#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if(_patientList.count>0){
            patientObj = _patientList[indexPath.row];
            DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
            [controller setPatDetails:patientObj];
            controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
            controller.navigationItem.leftItemsSupplementBackButton = YES;
        }
    }
}

#pragma mark - Table View
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (_patientList.count > 0) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
        
    } else {
        
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"No data is currently available. Please pull down to refresh.";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
        [messageLabel sizeToFit];
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 0;
}
 */


/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
*/


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _patientList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MyTableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    patientObj = _patientList[indexPath.row];
    
    UIImage *cellImage = [UIImage imageNamed:patientObj.usrImg];
    cell.imgView.image = cellImage;
    
//    CGFloat widthScale = cellImage.size.width / cell.frame.size.width;
//    CGFloat heightScale = cellImage.size.height / cell.frame.size.height;
    //this line will do it!
    //cell.imgView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    
    cell.imgView.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(173.0f/255.0f) blue:(199.0f/255.0f) alpha:1.0];
    cell.imgView.layer.masksToBounds = YES;
    cell.imgView.layer.cornerRadius = 32.0f;
    
    cell.nameLbl.text = patientObj.usrName;
    cell.nameLbl.font = [UIFont boldSystemFontOfSize:14.0f];
    cell.nameLbl.textColor= [UIColor colorWithRed:(10.0f/255.0f) green:(173.0f/255.0f) blue:(193.0f/255.0f) alpha:1.0];
    cell.ageLbl.text=patientObj.age;
    cell.genderLbl.text=patientObj.gender;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *urlString = [_siteAddresses objectAtIndex:indexPath.row];
//    _detailViewController.webView.scalesPageToFit = YES;
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.detailViewController.webView loadRequest:request];
    
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    UINavigationController *navigationController = [self.splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    
}
-(void)createDatabaseIfNeeded{
    
    BOOL success;
    NSError *error;
    
    //FileManager - Object allows easy access to the File System.
    NSFileManager *FileManager = [NSFileManager defaultManager];
    
    //Get the complete users document directory path.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Get the first path in the array.
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //Create the complete path to the database file.
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"PatientDetails.sqlite"];
    
    //Check if the file exists or not.
    success = [FileManager fileExistsAtPath:databasePath];
    
    //If the database is present then quit.
    if(success)
    {
        [self OpenDB:databasePath];
        return;
    }
    
    //the database does not exists, so we will copy it to the users document directory]
    NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"PatientDetails.sqlite"];
    
    //Copy the database file to the users document directory.
    success = [FileManager copyItemAtPath:dbPath toPath:databasePath error:&error];
    
    //If the above operation is not a success then display a message.
    //Error message can be seen in the debugger's console window.
    if(!success)
        NSAssert1(0, @"Failed to copy the database. Error: %@.", [error localizedDescription]);
    [self OpenDB:databasePath];
}

-(void)OpenDB:(NSString*)strDBPath
{
    if(!_db)
    {
        _db = [[FMDatabase alloc] initWithPath:strDBPath];
        if (![_db open]) {
            //(@"Could not open db.");
            return;
        }
        NSLog(@"FM DB instance ready at path = %@",strDBPath);
    }
}

@end
