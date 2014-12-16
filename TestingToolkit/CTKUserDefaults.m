//
//  CTKUserDefaults.m
//  TestingToolkit
//
//  Created by Christian Tietze on 19.06.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import "CTKUserDefaults.h"

@implementation CTKUserDefaults
static CTKUserDefaults *_sharedInstance = nil;
static dispatch_once_t once_token = 0;

+ (instancetype)sharedInstance
{
    dispatch_once(&once_token, ^{
        if (_sharedInstance == nil)
        {
            _sharedInstance = [[CTKUserDefaults alloc] init];
        }
    });
    
    return _sharedInstance;
}

+ (void)setSharedInstance:(CTKUserDefaults *)instance
{
    once_token = 0; // resets the once_token so dispatch_once will run again
    _sharedInstance = instance;
}

+ (void)resetSharedInstance
{
    [self setSharedInstance:nil];
}

+ (NSUserDefaults *)standardUserDefaults
{
    CTKUserDefaults *sharedInstance = [self sharedInstance];
    return sharedInstance.userDefaults;
}

+ (instancetype)userDefaultsWith:(NSUserDefaults *)userDefaults
{
    return [[self alloc] initWithUserDefaults:userDefaults];
}

- (instancetype)init
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self initWithUserDefaults:defaults];
}

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults
{
    NSParameterAssert(userDefaults);
    self = [super init];
    
    if (self)
    {
        _userDefaults = userDefaults;
    }
    
    return self;
}


@end
