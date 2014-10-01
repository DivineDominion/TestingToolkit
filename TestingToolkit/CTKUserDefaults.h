//
//  CTKUserDefaults.h
//  WordCounter
//
//  Created by Christian Tietze on 19.06.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTKUserDefaults : NSObject
@property (strong, readonly) NSUserDefaults *userDefaults;

+ (instancetype)sharedInstance;
+ (void)setSharedInstance:(CTKUserDefaults *)instance;
+ (void)resetSharedInstance;
+ (NSUserDefaults *)standardUserDefaults;

+ (instancetype)userDefaultsWith:(NSUserDefaults *)userDefaults;
- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults;

@end
