# TestingToolkit for Mac and iOS

A collection of common Cocoa singleton wrappers which are useful for unit-testing if your objects work well with:

- `NSUserDefaults`
- `NSNotificationCenter`
- `NSCalendar`'s `-autoupdatingCalendar` and `-autoupdatingLocale`

## Usage

### `NSNotificationCenter` Test Double/Recorder

To record and play back sent notifications from a test case, add a custom `NSNotificationCenter` subclass. (I prefer to inherit from `NSObject` to avoid unwanted side-effects and add methods until the informal protocol is satisfied. The following should give a good head start.)

    @interface TestNotificationCenter : NSObject
    @property (nonatomic, strong) NSMutableArray *notifications;
    @property (nonatomic, readonly) BOOL didReceiveNotifications;
    @end

    @implementation TestNotificationCenter
    - (NSArray *)notifications {
        if (!_notifications) {
            _notifications = [NSMutableArray array];
        }
    
        return _notifications;
    }

    - (BOOL)didReceiveNotifications {
        return self.notifications && self.notifications.count > 0;
    }

    - (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
        NSDictionary *notification = @{@"name" : aName, @"object" : anObject, @"userInfo" : aUserInfo};
        [self.notifications addObject:notification];
    }

    - (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject { /* no op */ }
    - (void)removeObserver:(id)observer { /* no op */ }
    - (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject { /* no op */ }
    @end

Then use the test double like this:

    @interface ExampleTests : XCTestCase
    @end
    
    @implementation ExampleTests
    {
        id objectUnderTest;
        TestNotificationCenter *testNotificationCenter;
    }

    - (void)setUp {
        [super setUp];
    
        testNotificationCenter = [[TestNotificationCenter alloc] init];
        [CTKNotificationCenter setSharedInstance:[CTKNotificationCenter notificationCenterWith:testNotificationCenter]];
        
        objectUnderTest = [[ExampleObject alloc] init];
    }

    - (void)tearDown {
        [CTKNotificationCenter resetSharedInstance];
        [super tearDown];
    }

    - (void)testDoingSomething_DoesntBroadcast {
        [objectUnderTest performSomeAction];
    
        XCTAssertFalse(testNotificationCenter.didReceiveNotifications);
    }
    // ...
    @end

Ensure that you obtain `NSNotificationCenter` throughout your application by calling `[CTKNotificationCenter defaultCenter]`.

# License

MIT license. For details, see `LICENSE` file.
