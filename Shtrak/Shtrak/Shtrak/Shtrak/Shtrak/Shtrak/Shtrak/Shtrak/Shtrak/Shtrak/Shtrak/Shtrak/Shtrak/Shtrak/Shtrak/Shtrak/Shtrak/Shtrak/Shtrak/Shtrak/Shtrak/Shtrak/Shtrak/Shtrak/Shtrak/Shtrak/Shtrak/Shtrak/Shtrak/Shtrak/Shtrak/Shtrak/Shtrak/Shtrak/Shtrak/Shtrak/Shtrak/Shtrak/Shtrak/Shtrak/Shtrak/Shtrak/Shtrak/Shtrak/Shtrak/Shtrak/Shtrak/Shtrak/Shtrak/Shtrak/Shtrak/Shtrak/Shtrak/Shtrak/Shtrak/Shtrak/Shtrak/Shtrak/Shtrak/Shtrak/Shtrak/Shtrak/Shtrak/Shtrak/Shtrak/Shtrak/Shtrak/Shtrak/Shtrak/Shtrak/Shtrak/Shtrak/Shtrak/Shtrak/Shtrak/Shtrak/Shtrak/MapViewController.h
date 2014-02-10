//
//  MapViewController.h
//  Shtrak
//
//  Created by Ivaylo Ivanov on 26.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapview;


-(IBAction)getLocation:(id)sender;
-(IBAction)setMap:(id)sender;

@end
