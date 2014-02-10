//
//  Note.h
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 04.04.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) NSDate * createDate;

@end
