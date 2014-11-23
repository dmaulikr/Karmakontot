#import "Help.h"
#import <RestKit/RestKit.h>


@interface Help ()

// Private interface goes here.

@end


@implementation Help

+(NSDictionary*)elementToPropertyMappings {
    return @{
             @"id" : @"answerId",
             @"updated" : @"updatedAt",
             @"text" : @"text",
             @"deleted" : @"deleted",
             @"frog.id" : @"leadsToFrog"
             };
}

+ (RKEntityMapping *)entityMappingForManagedObjectStore:(RKManagedObjectStore *)objectStore {
    RKEntityMapping *selfMapping = [RKEntityMapping mappingForEntityForName:@"Help" inManagedObjectStore:objectStore];
    [selfMapping addAttributeMappingsFromDictionary:[self elementToPropertyMappings]];
    
    selfMapping.identificationAttributes = @[@"helpId"];
    
    return selfMapping;
}

- (NSString *)title {
    return self.helpTitle;
}
- (NSString *)subtitle {
    return self.message;
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coord;
    coord.latitude = [self.latitude doubleValue];
    coord.longitude = [self.longitude doubleValue];
    
    return coord;
}

@end
