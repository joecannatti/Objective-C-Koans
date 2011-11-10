#if __has_feature(objc_arc)
#define INIT_FAILED  NSLog(@"INIT_FAILED %s:%d", __FILE__, __LINE__);
#import <Foundation/Foundation.h>

// Make reference to a Person before it is defined
@class Person;

@interface PhoneNumber : NSObject
@property (nonatomic,strong) NSString *countryCode;
@property (nonatomic,strong) NSString *areaCode;
@property (nonatomic,strong) NSString *digits;
@property (nonatomic,weak) Person *owner;    
@end

@implementation PhoneNumber
@synthesize countryCode,areaCode,digits,owner;
-(PhoneNumber*) initWithCountryCode:(NSString *) _countryCode 
                           areaCode: (NSString *) _areaCode 
                             digits: (NSString *) _digits {
  self = [super init];
  if (self) { // alloc succeeds
    self.countryCode = _countryCode;
    self.areaCode = _areaCode;
    self.digits = _digits;
    self.owner = nil;
  } else {
    INIT_FAILED
  }
  
  return self;
  
}

@end

@interface Person : NSObject
  @property (nonatomic, strong) NSString *firstName;
  @property (nonatomic, strong) NSString *lastName;
  @property (nonatomic, strong) NSNumber *yearOfBirth;
  @property (nonatomic, strong) Person *spouse;
  @property (nonatomic, strong) PhoneNumber *phoneNumber;

@end

@implementation Person
  @synthesize firstName, lastName, yearOfBirth, spouse, phoneNumber;

- (void)setPhoneNumber:(PhoneNumber *) _phoneNumber {
    phoneNumber = _phoneNumber;
    phoneNumber.owner = self;
}


@end

#import "Kiwi.h"


SPEC_BEGIN(AboutARC)

describe(@"About Automatic Reference Counting", ^{
  
  context(@"PhoneNumber",^{
    __block PhoneNumber * phoneNumber;
  
    beforeAll(^{
      phoneNumber = [[PhoneNumber alloc] 
                     initWithCountryCode:@"1"
                                areaCode:@"604" 
                                  digits:@"334-3244"];
    });
    it(@"can be initalized with area code and digits and countryCode without an owner", ^{
      
      [[theValue(phoneNumber.areaCode) should] equal:theValue(@"604")];
      [[theValue(phoneNumber.digits) should] equal:theValue(@"334-3244")];
      [[theValue(phoneNumber.countryCode) should] equal:theValue(@"1")];
      
      [phoneNumber.owner shouldBeNil];
      
    });
    it(@"can have an owner set",^{
      Person *aPerson = [[Person alloc] init];
      [phoneNumber setOwner:aPerson];
      [phoneNumber.owner shouldNotBeNil];
      [[phoneNumber.owner should] beIdenticalTo:aPerson];    
    });
    it(@"arc disables retain",^{
      // [phoneNumber retain];
      // bypassing ARC  will create memory leaks
      //[phoneNumber performSelector:NSSelectorFromString(@"retain")];      
    });
  });
  
  context(@"Person",^{
    it(@"sets a phone number to be owned by this person", ^{
      Person *me = [[Person alloc] init];
      PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithCountryCode:@"1" 
                                                                 areaCode:@"555" 
                                                                   digits:@"444-1234"];
      [me setPhoneNumber:phoneNumber];
      [[phoneNumber.owner should] beIdenticalTo:me];        
      
    });
  });
});
SPEC_END
#endif