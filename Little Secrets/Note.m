//
//  Note.m
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 04.04.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "Note.h"


@implementation Note

@dynamic title;
@dynamic category;
@dynamic details;
@dynamic priority;
@dynamic createDate;

-(void) awakeFromInsert {
    [super awakeFromInsert];
    self.createDate = [NSDate date];
}

@end
