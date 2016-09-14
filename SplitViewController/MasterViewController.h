//
//  MasterViewController.h
//  SplitViewController
//
//  Created by vignesh on 9/8/16.
//  Copyright © 2016 vignesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLiteManager.h"
#import "FMDatabase.h"


@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic)  FMDatabase *db;

@property (nonatomic, strong) NSMutableArray *patientList;

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

