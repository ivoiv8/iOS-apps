//
//  AnnotationView.m
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 25.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "AnnotationView.h"
#import "CurrentLocationAnnotation.h"

@interface AnnotationView ()
@property (nonatomic, assign) BOOL hasBuiltInDraggingSupport;
@end

@implementation AnnotationView

@synthesize hasBuiltInDraggingSupport;
@synthesize mapView;


- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {

       self.hasBuiltInDraggingSupport = [[MKAnnotationView class] instancesRespondToSelector:NSSelectorFromString(@"isDraggable")];

       if (self.hasBuiltInDraggingSupport) {
            if ((self = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier])) {
                 [self performSelector:NSSelectorFromString(@"setDraggable:") withObject:[NSNumber numberWithBool:YES]];
            }
       }
       self.canShowCallout = YES;

       return self;
}
@end
