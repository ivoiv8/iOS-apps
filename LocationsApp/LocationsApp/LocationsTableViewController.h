//
//  LocationsTableViewController.h
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 21.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddLocationViewController.h"
#import <CoreData/CoreData.h>


@interface LocationsTableViewController : UITableViewController
//<AddLocationViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
