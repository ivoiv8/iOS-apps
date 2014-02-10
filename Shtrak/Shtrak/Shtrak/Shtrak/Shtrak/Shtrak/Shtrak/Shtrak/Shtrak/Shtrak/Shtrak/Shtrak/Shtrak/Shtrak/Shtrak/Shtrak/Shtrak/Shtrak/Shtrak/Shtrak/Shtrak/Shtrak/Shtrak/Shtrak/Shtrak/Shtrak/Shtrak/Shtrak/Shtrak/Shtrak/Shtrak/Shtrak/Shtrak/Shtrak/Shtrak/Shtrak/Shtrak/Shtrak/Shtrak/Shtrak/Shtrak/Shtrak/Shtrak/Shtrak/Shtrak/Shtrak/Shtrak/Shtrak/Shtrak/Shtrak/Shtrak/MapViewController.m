//
//  MapViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 26.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController


- (IBAction)getLocation: (id)sender {
    _mapview.showsUserLocation = YES;
    [_mapview setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

-(IBAction)setMap:(id)sender{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            _mapview.mapType = MKMapTypeHybrid;
            break;
            
        default: _mapview.mapType = MKMapTypeStandard;
            break;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_mapview setMapType:MKMapTypeStandard];
    [_mapview setZoomEnabled:YES];
    [_mapview setScrollEnabled:YES];
    
    MKCoordinateRegion startregion = {{0.0, 0.0}, {0.0, 0.0}};
    
    startregion.center.latitude = 43.216667;
    
    startregion.center.longitude = 27.916667;
    
    startregion.span.latitudeDelta = 1.0f;
    
    startregion.span.longitudeDelta = 1.0f;
    
    [_mapview setRegion:startregion animated:YES];
    
    
    MKCoordinateRegion annotationRegion = {{0.0, 0.0}, {0.0, 0.0}};
    
    annotationRegion.center.latitude = 43.201907;
    
    annotationRegion.center.longitude = 27.9142;
    
    MKPointAnnotation *varna = [[MKPointAnnotation alloc] init];
    
    
    varna.title = @"Варна";
    varna.subtitle = @"Shtrak - в най-добрият град за живеене :)";
    varna.coordinate = annotationRegion.center;
    [_mapview addAnnotation:varna];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
