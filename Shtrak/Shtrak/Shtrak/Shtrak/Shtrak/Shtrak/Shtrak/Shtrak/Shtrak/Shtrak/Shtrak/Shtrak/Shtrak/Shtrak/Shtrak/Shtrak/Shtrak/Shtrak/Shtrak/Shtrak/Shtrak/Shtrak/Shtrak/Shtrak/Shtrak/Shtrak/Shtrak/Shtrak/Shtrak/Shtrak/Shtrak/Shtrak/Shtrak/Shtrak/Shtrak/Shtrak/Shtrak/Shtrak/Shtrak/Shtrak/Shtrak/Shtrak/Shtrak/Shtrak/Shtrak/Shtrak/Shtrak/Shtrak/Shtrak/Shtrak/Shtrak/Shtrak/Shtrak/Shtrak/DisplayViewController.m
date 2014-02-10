//
//  DisplayViewController.m
//  PhotoViewer
//
//  Created by Ivaylo Ivanov on 23.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

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
    
    UIImage *image = [UIImage imageNamed:_currentPhoto.filename];
    [self.currentImage setImage:image];
    [self setTitle:_currentPhoto.name];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    InfoViewController *ivc = [segue destinationViewController];
    [ivc setCurrentPhoto:self.currentPhoto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
