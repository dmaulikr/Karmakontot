// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *karma;
	__unsafe_unretained NSString *mail;
	__unsafe_unretained NSString *url;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *help;
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;

@class Help;





@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;





@property (nonatomic, strong) NSNumber* karma;



@property int32_t karmaValue;
- (int32_t)karmaValue;
- (void)setKarmaValue:(int32_t)value_;

//- (BOOL)validateKarma:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mail;



//- (BOOL)validateMail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *help;

- (NSMutableSet*)helpSet;





@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addHelp:(NSSet*)value_;
- (void)removeHelp:(NSSet*)value_;
- (void)addHelpObject:(Help*)value_;
- (void)removeHelpObject:(Help*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveKarma;
- (void)setPrimitiveKarma:(NSNumber*)value;

- (int32_t)primitiveKarmaValue;
- (void)setPrimitiveKarmaValue:(int32_t)value_;




- (NSString*)primitiveMail;
- (void)setPrimitiveMail:(NSString*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;





- (NSMutableSet*)primitiveHelp;
- (void)setPrimitiveHelp:(NSMutableSet*)value;


@end
