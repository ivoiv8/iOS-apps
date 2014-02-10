//
//  MapAnnotation.h
//  Shtrak
//
//  Created by Ivaylo Ivanov on 28.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MKAnnotation.h>

@interface MapAnnotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *_title;
    NSString *_subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
