//
//  MapViewController.h
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 20.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddLocationViewController.h"
#import <MapKit/MapKit.h>
#import "CoreLocationController.h"
#import "AnnotationView.h"
#import "CurrentLocationAnnotation.h"


@interface MapViewController : UIViewController <CoreLocationControllerDelegate,
AddLocationViewControllerDelegate, NSFetchedResultsControllerDelegate>{
    
    CLLocationManager* locationManager;
    CLLocation* currentLocation;
}

//@property (weak, nonatomic) IBOutlet UILabel *lblLongitude;
//@property (weak, nonatomic) IBOutlet UILabel *lblLatitude;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CoreLocationController *locationController;

@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, retain) CLLocation* currentLocation;


- (IBAction)tappedSave:(id)sender;
- (IBAction)longPressGesture:(id)sender;


@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;



-(IBAction)getLocation:(id)sender;
-(IBAction)setMap:(id)sender;

@end
