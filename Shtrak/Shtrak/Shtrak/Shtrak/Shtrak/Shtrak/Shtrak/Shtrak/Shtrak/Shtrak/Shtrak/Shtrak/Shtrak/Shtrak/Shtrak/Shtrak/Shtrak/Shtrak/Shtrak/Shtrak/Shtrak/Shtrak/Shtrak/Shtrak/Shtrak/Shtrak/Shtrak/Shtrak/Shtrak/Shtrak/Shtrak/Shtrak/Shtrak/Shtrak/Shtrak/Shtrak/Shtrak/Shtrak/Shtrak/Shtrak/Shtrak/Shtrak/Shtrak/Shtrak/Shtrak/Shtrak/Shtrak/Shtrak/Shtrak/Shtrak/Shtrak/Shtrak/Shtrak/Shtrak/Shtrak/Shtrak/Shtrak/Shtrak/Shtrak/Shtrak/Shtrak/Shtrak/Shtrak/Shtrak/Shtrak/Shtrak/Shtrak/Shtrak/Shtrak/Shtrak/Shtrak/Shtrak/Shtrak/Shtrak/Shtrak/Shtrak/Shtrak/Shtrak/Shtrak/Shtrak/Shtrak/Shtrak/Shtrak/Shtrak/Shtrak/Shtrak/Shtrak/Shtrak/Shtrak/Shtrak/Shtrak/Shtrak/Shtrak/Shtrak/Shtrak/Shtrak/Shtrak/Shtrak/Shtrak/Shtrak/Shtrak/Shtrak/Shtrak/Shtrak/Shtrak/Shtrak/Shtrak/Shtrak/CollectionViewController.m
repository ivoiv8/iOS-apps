//
//  CollectionViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 02.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "PhotoViewController.h"

@interface CollectionViewController ()
{
    NSArray *arrayOfImages;
}

@end

@implementation CollectionViewController

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
	// Do any additional setup after loading the view.
    
    arrayOfImages = [[NSArray alloc] initWithObjects:@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg", @"image5.jpg", @"image6.jpg", @"image7.jpg", @"image8.jpg", @"image9.jpg", @"image10.jpg", @"image11.jpg", @"image12.jpg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PhotoSegue"]) {
        CollectionViewCell *cell = (CollectionViewCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        
        
        PhotoViewController *idvc = (PhotoViewController *)[segue destinationViewController];
        idvc.img = [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfImages count];

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    cell.imageView.image = [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]];
    return cell;
    
}


@end
