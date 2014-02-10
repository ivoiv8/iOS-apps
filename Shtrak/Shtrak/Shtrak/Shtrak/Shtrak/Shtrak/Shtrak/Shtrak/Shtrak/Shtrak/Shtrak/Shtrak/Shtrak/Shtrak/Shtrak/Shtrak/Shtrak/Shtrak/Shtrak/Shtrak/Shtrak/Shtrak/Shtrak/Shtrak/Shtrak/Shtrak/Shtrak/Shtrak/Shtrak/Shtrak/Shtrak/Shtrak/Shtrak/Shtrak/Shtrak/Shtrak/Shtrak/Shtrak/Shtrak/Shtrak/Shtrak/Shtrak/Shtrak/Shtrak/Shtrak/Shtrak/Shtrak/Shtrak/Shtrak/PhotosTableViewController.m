//
//  PhotosTableViewController.m
//  PhotoViewer
//
//  Created by Ivaylo Ivanov on 23.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

NSMutableArray *photos;

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowPhoto"]) {
        DisplayViewController *dvc = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Photo *c = [photos objectAtIndex:path.row];
        [dvc setCurrentPhoto:c];
    }
    
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    photos = [[NSMutableArray alloc] init];
    
    Photo *pic = [[Photo alloc] init];
    [pic setName:@"Флаер 1"];
    [pic setFilename:@"1.jpg"];
    [pic setNotes:@"Флаер за солните лампи"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Флаер 2"];
    [pic setFilename:@"2.jpg"];
    [pic setNotes:@"Флаер за минералите"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Флаер 3"];
    [pic setFilename:@"3.jpg"];
    [pic setNotes:@"Флаер за солните лампи"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Флаер 4"];
    [pic setFilename:@"4.jpg"];
    [pic setNotes:@"Флаер за фън шуй"];
    [photos addObject:pic];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Photo *current = [photos objectAtIndex:indexPath.row];
    [cell.textLabel setText:current.name];
    
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
