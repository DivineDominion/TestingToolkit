//
//  CTWNotificationCenter.m
//  WordCounter
//
//  Created by Christian Tietze on 06.06.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import "CTKNotificationCenter.h"

@implementation CTKNotificationCenter

static CTKNotificationCenter *_sharedInstance = nil;
static dispatch_once_t once_token = 0;

+ (instancetype)sharedInstance
{
    dispatch_once(&once_token, ^{
        if (_sharedInstance == nil)
        {
            _sharedInstance = [[CTKNotificationCenter alloc] init];
        }
    });
    
    return _sharedInstance;
}

+ (void)setSharedInstance:(CTKNotificationCenter *)instance
{
    once_token = 0; // resets the once_token so dispatch_once will run again
    _sharedInstance = instance;
}

+ (void)resetSharedInstance
{
    [self setSharedInstance:nil];
}

+ (NSNotificationCenter *)defaultCenter
{
    CTKNotificationCenter *sharedInstance = [self sharedInstance];
    return sharedInstance.notificationCenter;
}

+ (instancetype)notificationCenterWith:(NSNotificationCenter *)notificationCenter
{
    return [[self alloc] initWithNotificationCenter:notificationCenter];
}

- (instancetype)init
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    return [self initWithNotificationCenter:defaultCenter];
}

- (instancetype)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter
{
    NSParameterAssert(notificationCenter);
    self = [super init];
    
    if (self)
    {
        _notificationCenter = notificationCenter;
    }
    
    return self;
}

@end

