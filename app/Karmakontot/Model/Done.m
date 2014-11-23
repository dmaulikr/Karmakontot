#import "Done.h"
#import <RestKit/RestKit.h>


@interface Done ()

@end


@implementation Done

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
    RKEntityMapping *selfMapping = [RKEntityMapping mappingForEntityForName:@"Done" inManagedObjectStore:objectStore];
    [selfMapping addAttributeMappingsFromDictionary:[self elementToPropertyMappings]];
    
    selfMapping.identificationAttributes = @[@"doneId"];
    
    return selfMapping;
}

@end
