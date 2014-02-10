//
//  MnogoFirmiViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 05.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "MnogoFirmiViewController.h"

@interface MnogoFirmiViewController ()

@end

@implementation MnogoFirmiViewController

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
    [mnogoFirmi loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mnogofirmi.com"]]];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
