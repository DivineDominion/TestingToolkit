//
//  CTKNotificationCenter.h
//  WordCounter
//
//  Created by Christian Tietze on 06.06.14.
//  Copyright (c) 2014 Christian Tietze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTKNotificationCenter : NSObject
@property (strong, readonly) NSNotificationCenter *notificationCenter;

+ (instancetype)sharedInstance;
+ (void)setSharedInstance:(CTKNotificationCenter *)instance;
+ (void)resetSharedInstance;
+ (NSNotificationCenter *)defaultCenter;

+ (instancetype)notificationCenterWith:(NSNotificationCenter *)notificationCenter;
- (instancetype)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter;
@end
