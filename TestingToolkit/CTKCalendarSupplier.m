//
//  CTKCalendarSupplier.m
//  WordCounter
//
//  Created by Christian Tietze on 14.04.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import "CTKCalendarSupplier.h"

@implementation CTKCalendarSupplier
static CTKCalendarSupplier *_sharedInstance = nil;
static dispatch_once_t once_token = 0;

+ (instancetype)sharedInstance
{
    dispatch_once(&once_token, ^{
        if (_sharedInstance == nil)
        {
            _sharedInstance = [[CTKCalendarSupplier alloc] init];
        }
    });
    
    return _sharedInstance;
}

+ (void)setSharedInstance:(CTKCalendarSupplier *)instance
{
    once_token = 0; // resets the once_token so dispatch_once will run again
    _sharedInstance = instance;
}

+ (void)resetSharedInstance
{
    [self setSharedInstance:nil];
}

+ (instancetype)calendarSupplier
{
    return [self sharedInstance];
}


#pragma mark -

- (NSCalendar *)autoupdatingCalendar
{
    return [NSCalendar autoupdatingCurrentCalendar];
}

- (NSLocale *)autoupdatingLocale
{
    return [NSLocale autoupdatingCurrentLocale];
}
@end
