// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Help.m instead.

#import "_Help.h"

const struct HelpAttributes HelpAttributes = {
	.helpId = @"helpId",
	.helpTitle = @"helpTitle",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.message = @"message",
	.postingUser = @"postingUser",
	.timeStamp = @"timeStamp",
	.url = @"url",
};

const struct HelpRelationships HelpRelationships = {
	.done = @"done",
	.user = @"user",
};

const struct HelpFetchedProperties HelpFetchedProperties = {
};

@implementation HelpID
@end

@implementation _Help

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Help" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Help";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Help" inManagedObjectContext:moc_];
}

- (HelpID*)objectID {
	return (HelpID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"helpIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"helpId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic helpId;



- (int32_t)helpIdValue {
	NSNumber *result = [self helpId];
	return [result intValue];
}

- (void)setHelpIdValue:(int32_t)value_ {
	[self setHelpId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveHelpIdValue {
	NSNumber *result = [self primitiveHelpId];
	return [result intValue];
}

- (void)setPrimitiveHelpIdValue:(int32_t)value_ {
	[self setPrimitiveHelpId:[NSNumber numberWithInt:value_]];
}





@dynamic helpTitle;






@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic message;






@dynamic postingUser;






@dynamic timeStamp;






@dynamic url;






@dynamic done;

	

@dynamic user;

	






@end
