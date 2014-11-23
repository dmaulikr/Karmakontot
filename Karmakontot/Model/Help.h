#import "_Help.h"
#import <MapKit/MapKit.h>

@interface Help : _Help  {}

+(NSDictionary*)elementToPropertyMappings;

- (NSString *)title;
- (NSString *)subtitle;
- (CLLocationCoordinate2D)coordinate;



@end
