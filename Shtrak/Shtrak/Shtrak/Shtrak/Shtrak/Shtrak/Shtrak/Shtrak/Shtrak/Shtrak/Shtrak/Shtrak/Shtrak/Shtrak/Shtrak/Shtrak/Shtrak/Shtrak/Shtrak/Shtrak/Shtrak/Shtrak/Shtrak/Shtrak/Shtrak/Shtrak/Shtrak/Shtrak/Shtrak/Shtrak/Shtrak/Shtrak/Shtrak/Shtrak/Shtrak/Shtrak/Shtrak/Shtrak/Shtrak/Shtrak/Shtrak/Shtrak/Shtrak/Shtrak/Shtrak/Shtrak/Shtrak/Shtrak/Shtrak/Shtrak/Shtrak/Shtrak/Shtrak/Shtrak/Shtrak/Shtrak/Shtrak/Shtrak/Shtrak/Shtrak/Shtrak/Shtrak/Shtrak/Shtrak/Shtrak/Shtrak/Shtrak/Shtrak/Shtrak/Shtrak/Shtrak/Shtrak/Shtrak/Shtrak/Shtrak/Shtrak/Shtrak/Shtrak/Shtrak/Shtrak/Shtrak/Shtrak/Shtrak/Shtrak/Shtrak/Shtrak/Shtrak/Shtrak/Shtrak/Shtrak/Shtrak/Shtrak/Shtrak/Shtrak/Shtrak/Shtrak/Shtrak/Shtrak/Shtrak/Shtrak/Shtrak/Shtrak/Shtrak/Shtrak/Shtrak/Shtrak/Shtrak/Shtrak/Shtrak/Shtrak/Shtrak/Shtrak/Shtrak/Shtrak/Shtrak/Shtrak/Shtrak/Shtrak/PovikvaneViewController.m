//
//  PovikvaneViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 05.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "PovikvaneViewController.h"

@interface PovikvaneViewController ()

@end

@implementation PovikvaneViewController

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
    [povikvane loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shtrak.bg/povikvane/"]]];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
