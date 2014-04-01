//
//  MenuViewController.m
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 11.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import "MenuViewController.h"
#import "ECSlidingViewController.h"

@interface MenuViewController ()


//@property (nonatomic, strong) UINavigationController *transitionsNavigationController;

@end

@implementation MenuViewController

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

    _menu = @[@"icon1.png",
              @"icon2.png",
              @"icon3.png",
              @"icon4.png",
              @"icon5.png",
              @"icon6.png"];
    
    
    [self.slidingViewController setAnchorRightRevealAmount:50.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
    NSLog(@"menu count is %i", _menu.count);
    
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
    return _menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%d.png",indexPath.row +1]];
    
    return cell;
}


#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier;
    
    switch (indexPath.row) {
        case 0:
            identifier = @"Main";
            break;
            
        case 1:
            identifier = @"Services";
            break;
            
        case 2:
            identifier = @"Main";
            break;
            
        case 3:
            identifier = @"Main";
            break;
            
        case 4:
            identifier = @"Main";
            break;
            
        case 5:
            identifier = @"SignIn";
            break;
            
        default:
            break;
    }
    
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.tableView.frame.size.height / _menu.count;
}



@end
