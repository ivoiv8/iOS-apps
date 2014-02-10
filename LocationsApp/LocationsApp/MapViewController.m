//
//  MapViewController.m
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 20.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

//@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) id delegate;

@end

@implementation MapViewController


- (IBAction)getLocation: (id)sender {
    CLLocationCoordinate2D location=_mapView.userLocation.coordinate;
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.005f;
	span.longitudeDelta = 0.005f;
	region.span = span;
	region.center = location;
	[_mapView setRegion:region animated:YES];
	[_mapView regionThatFits:region];
//	_currentAction = region;
}


- (IBAction)tappedSave:(id)sender {
        }
    
//    CLLocationCoordinate2D mapPoint;
//    mapPoint.longitude = 27.9142;
//    mapPoint.latitude = 43.201900;
//    
//    MKPointAnnotation *anny = [[MKPointAnnotation alloc] init];
//    anny.coordinate = mapPoint;
//    anny.title = @"Annotation description";
//    anny.subtitle = @"Annotation subtitle";
//    [self.mapView addAnnotation:anny];


//- (IBAction)longPressGesture:(id)sender {
//    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
//    [self.mapView addGestureRecognizer:longPressGesture];
//}
//
//- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation {
//    if ([annotation isKindOfClass:[MKUserLocation class]]) {
//        return nil;
//    }
//    static NSString *AnnotationViewID = @"annotationViewID";
//    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
//    if (annotationView == nil) {
//        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
//    }
//    annotationView.canShowCallout = YES;
//    annotationView.annotation = annotation;
//    annotationView.animatesDrop = YES;
//    return annotationView;
//}


-(IBAction)setMap:(id)sender{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = MKMapTypeHybrid;
            break;
            
        default: _mapView.mapType = MKMapTypeStandard;
            break;
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [locationManager stopUpdatingLocation];
    if(currentLocation == nil) currentLocation = newLocation;
    else if (newLocation.horizontalAccuracy < currentLocation.horizontalAccuracy) currentLocation = newLocation;
    
    [_mapView setRegion:MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(0.05f, 0.05f))];
    [_mapView setShowsUserLocation:NO];
    
    CurrentLocationAnnotation *annotation = [[CurrentLocationAnnotation alloc] initWithCoordinate:self.currentLocation.coordinate addressDictionary:nil];
    annotation.title = @"Drag Me!";
    annotation.subtitle = @"Drag pin to get desired location..";
    
    [_mapView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)MapView viewForAnnotation:(id <MKAnnotation>)annotation
  {
       static NSString * const kPinAnnotationIdentifier = @"PinIdentifier";
       MKAnnotationView *draggablePinView = [MapView dequeueReusableAnnotationViewWithIdentifier:kPinAnnotationIdentifier];

            if (draggablePinView) {
            draggablePinView.annotation = annotation;
            } else {
            draggablePinView = [[AnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kPinAnnotationIdentifier];
            if ([draggablePinView isKindOfClass:[AnnotationView class]]) {
                 ((AnnotationView *)draggablePinView).mapView = MapView;
            }
       }
       return draggablePinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
  {
       if (oldState == MKAnnotationViewDragStateDragging) {
            CurrentLocationAnnotation *annotation = (CurrentLocationAnnotation *)annotationView.annotation;
            annotation.subtitle = [NSString stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];
       }
  }


-(void) addLocationViewControllerDidCancel:(Location *)locationToDelete {
    NSManagedObjectContext *context = self.managedObjectContext;
    [context deleteObject:locationToDelete];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) addLocationViewControllerDidSave {
    
    NSError *error = nil;
    NSManagedObjectContext *context = self.managedObjectContext;
    if (![context save:&error]) {
        NSLog(@"Error! %@", error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_mapView setMapType:MKMapTypeHybrid];
       [_mapView setDelegate:self];

       locationManager = [[CLLocationManager alloc] init];
       [locationManager setDelegate:self];
       [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
       if(!locationManager.locationServicesEnabled) {
            UIAlertView *locationServiceDisabledAlert = [[UIAlertView alloc]
                                                                    initWithTitle:@"Location Services Disabled"
                                                                    message:@"Location Service is disabled on this device. To enable Location Services go to Settings -> General and set the Location Services switch to ON"
                                                                    delegate:self
                                                                    cancelButtonTitle:@"Ok"
                                                                    otherButtonTitles:nil];
            [locationServiceDisabledAlert show];
}

       [locationManager startUpdatingLocation];
    
//    self.mapView.showsUserLocation = YES;
//    self.mapView.delegate = self;
//
//    
//    self.locationController = [[CoreLocationController alloc] init];
//	self.locationController.delegate = self;
//	[self.locationController.locationManager startUpdatingLocation];
    
    
}

//-(void)handleLongPressGesture:(UIGestureRecognizer*)sender {
//    // This is important if you only want to receive one tap and hold event
//    if (sender.state == UIGestureRecognizerStateEnded)
//    {
//        [self.mapView removeGestureRecognizer:sender];
//    }
//    else
//    {
//        MKPinAnnotationView *anny = [[MKPinAnnotationView alloc] init];
//        
//        // Here we get the CGPoint for the touch and convert it to latitude and longitude coordinates to display on the map
//        CGPoint point = [sender locationInView:self.mapView];
//        CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
//        // Then all you have to do is create the annotation and add it to the map
//        MKPinAnnotationView *dropPin = [[MKPinAnnotationView alloc] init];
//        dropPin.latitude = [NSNumber numberWithDouble:locCoord.latitude];
//        dropPin.longitude = [NSNumber numberWithDouble:locCoord.longitude];
//        [self.mapView addAnnotation:dropPin];
//    }
//}

- (void)update:(CLLocation *)location {
//    self.lblLatitude.text= [NSString stringWithFormat:@"Latitude: %f", [location coordinate].latitude];
//    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %f", [location coordinate].longitude];
}

- (void)locationError:(NSError *)error {
//    self.lblLatitude.text = [error description];
//    self.lblLongitude.text = nil;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
