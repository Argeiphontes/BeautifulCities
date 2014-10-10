//
//  City.h
//  BeautifulCities
//
//  Created by Christopher on 10/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface City : NSObject
@property NSString *city;
@property NSString *state;
@property UIImage *image;

- (instancetype) initWithName: (NSString *)cityAndState;

@end
