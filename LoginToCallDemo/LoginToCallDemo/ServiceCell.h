//
//  ServiceCell.h
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 11.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *discount;

@end
