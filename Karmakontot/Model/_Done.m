// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Done.m instead.

#import "_Done.h"

const struct DoneAttributes DoneAttributes = {
	.doneId = @"doneId",
	.ownedBy = @"ownedBy",
	.timeStamp = @"timeStamp",
	.url = @"url",
};

const struct DoneRelationships DoneRelationships = {
	.help = @"help",
};

const struct DoneFetchedProperties DoneFetchedProperties = {
};

@implementation DoneID
@end

@implementation _Done

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Done" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Done";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Done" inManagedObjectContext:moc_];
}

- (DoneID*)objectID {
	return (DoneID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"doneIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"doneId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic doneId;



- (int32_t)doneIdValue {
	NSNumber *result = [self doneId];
	return [result intValue];
}

- (void)setDoneIdValue:(int32_t)value_ {
	[self setDoneId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDoneIdValue {
	NSNumber *result = [self primitiveDoneId];
	return [result intValue];
}

- (void)setPrimitiveDoneIdValue:(int32_t)value_ {
	[self setPrimitiveDoneId:[NSNumber numberWithInt:value_]];
}





@dynamic ownedBy;






@dynamic timeStamp;






@dynamic url;






@dynamic help;

	






@end
