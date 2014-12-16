//
//  CTKCalendarSupplier.h
//  TestingToolkit
//
//  Created by Christian Tietze on 14.04.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTKCalendarSupplier : NSObject
+ (instancetype)calendarSupplier;
+ (instancetype)sharedInstance;
+ (void)setSharedInstance:(CTKCalendarSupplier *)instance;
+ (void)resetSharedInstance;

- (NSCalendar *)autoupdatingCalendar;
- (NSLocale *)autoupdatingLocale;
@end
