//
//  City.h
//  CodeChallenge2
//
//  Created by S on 10/10/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CityDelegate // do I need this-> <NSObject>

- (void)sendToSite:(id)sender; //stopped while on step 4 - defining this and the method on the city.m file
@end

@interface City : NSObject
@property NSString *name;
@property NSString *state;
@property NSString *site;

- (void) getSite:(City *)sender;

@property id <CityDelegate> delegate;

@end
