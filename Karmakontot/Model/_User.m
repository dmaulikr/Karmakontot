// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.karma = @"karma",
	.mail = @"mail",
	.url = @"url",
};

const struct UserRelationships UserRelationships = {
	.help = @"help",
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"karmaValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"karma"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic karma;



- (int32_t)karmaValue {
	NSNumber *result = [self karma];
	return [result intValue];
}

- (void)setKarmaValue:(int32_t)value_ {
	[self setKarma:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveKarmaValue {
	NSNumber *result = [self primitiveKarma];
	return [result intValue];
}

- (void)setPrimitiveKarmaValue:(int32_t)value_ {
	[self setPrimitiveKarma:[NSNumber numberWithInt:value_]];
}





@dynamic mail;






@dynamic url;






@dynamic help;

	
- (NSMutableSet*)helpSet {
	[self willAccessValueForKey:@"help"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"help"];
  
	[self didAccessValueForKey:@"help"];
	return result;
}
	






@end
