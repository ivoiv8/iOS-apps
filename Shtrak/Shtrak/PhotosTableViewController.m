//
//  PhotosTableViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 12.03.13.
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
    [pic setName:@"Червен Кръст Валдоста"];
    [pic setFilename:@"image1.jpg"];
    [pic setNotes:@"Червен Кръст Валдоста"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"ClientTell"];
    [pic setFilename:@"image2.jpg"];
    [pic setNotes:@"ClientTell"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"EnviroLight USA"];
    [pic setFilename:@"image3.jpg"];
    [pic setNotes:@"EnviroLight USA"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Investors Management Company"];
    [pic setFilename:@"image4.jpg"];
    [pic setNotes:@"Investors Management Company"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Ресторант Las Banderas"];
    [pic setFilename:@"image5.jpg"];
    [pic setNotes:@"Ресторант Las Banderas"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Medical Career DE"];
    [pic setFilename:@"image6.jpg"];
    [pic setNotes:@"Medical Career DE"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Povikvane"];
    [pic setFilename:@"image7.jpg"];
    [pic setNotes:@"Povikvane"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Щрак.com"];
    [pic setFilename:@"image8.jpg"];
    [pic setNotes:@"Щрак.com"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Апартаменти Spring Chase"];
    [pic setFilename:@"image9.jpg"];
    [pic setNotes:@"Апартаменти Spring Chase"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"The Gardens Valdosta"];
    [pic setFilename:@"image10.jpg"];
    [pic setNotes:@"The Gardens Valdosta"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"The Links Apartments"];
    [pic setFilename:@"image11.jpg"];
    [pic setNotes:@"The Links Apartments"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"Летище Валдоста"];
    [pic setFilename:@"image12.jpg"];
    [pic setNotes:@"Летище Валдоста"];
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
