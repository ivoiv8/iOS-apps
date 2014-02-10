//
//  CurrentLocationAnnotation.h
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 25.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <MapKit/MapKit.h>

  @interface CurrentLocationAnnotation : MKPlacemark {
}

  @property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;

  @property (nonatomic, retain) NSString *title;
  @property (nonatomic, retain) NSString *subtitle;

@end
