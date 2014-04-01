//
//  ServicesViewController.m
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 10.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import "ServicesViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface ServicesViewController ()

@end

@implementation ServicesViewController


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
    
    [self getDataFromPlist];

    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)getDataFromPlist {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Services" ofType:@"plist"];
    self.services = [NSArray arrayWithContentsOfFile:plistPath];
}


#pragma mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSArray *cells = [self.services objectAtIndex:section];
    
    switch (collectionView.tag) {
            
        case 0:
            return 10;
            break;
            
        case 1:
            return 4;
            break;
            
        case 2:
            
            return [cells count];
            break;
            
        default: nil;
            break;
            
    }
    
    return 1;
    
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}



-(void)configureCell:(ServiceCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *service = [self.services objectAtIndex:indexPath.section];
    
    cell.icon.image = [UIImage imageNamed:[[service objectAtIndex:indexPath.row] objectForKey:@"icon"]];
    cell.label.text = [[service objectAtIndex:indexPath.row] objectForKey:@"label"];
    cell.discount.image = [UIImage imageNamed:[[service objectAtIndex:indexPath.row] objectForKey:@"discount"]];
    
    
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 0) {
        
        CallOperatorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OperatorCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"operator%d.png",indexPath.row +1]];
        
        return cell;
    }
    
    
    if (collectionView.tag == 1) {
        
        OfferCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OfferCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"offer%d.png",indexPath.row +1]];
        
        return cell;
        
        
    } else {
        
        ServiceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceCell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        
        return cell;
    }
    
}



- (IBAction)revealMenu:(id)sender {
    
    [self.slidingViewController anchorTopViewTo:ECRight];
}
@end
