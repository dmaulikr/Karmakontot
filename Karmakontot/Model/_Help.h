// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Help.h instead.

#import <CoreData/CoreData.h>


extern const struct HelpAttributes {
	__unsafe_unretained NSString *helpId;
	__unsafe_unretained NSString *helpTitle;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *message;
	__unsafe_unretained NSString *postingUser;
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *url;
} HelpAttributes;

extern const struct HelpRelationships {
	__unsafe_unretained NSString *done;
	__unsafe_unretained NSString *user;
} HelpRelationships;

extern const struct HelpFetchedProperties {
} HelpFetchedProperties;

@class Done;
@class User;










@interface HelpID : NSManagedObjectID {}
@end

@interface _Help : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HelpID*)objectID;





@property (nonatomic, strong) NSNumber* helpId;



@property int32_t helpIdValue;
- (int32_t)helpIdValue;
- (void)setHelpIdValue:(int32_t)value_;

//- (BOOL)validateHelpId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* helpTitle;



//- (BOOL)validateHelpTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* message;



//- (BOOL)validateMessage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postingUser;



//- (BOOL)validatePostingUser:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Done *done;

//- (BOOL)validateDone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _Help (CoreDataGeneratedAccessors)

@end

@interface _Help (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveHelpId;
- (void)setPrimitiveHelpId:(NSNumber*)value;

- (int32_t)primitiveHelpIdValue;
- (void)setPrimitiveHelpIdValue:(int32_t)value_;




- (NSString*)primitiveHelpTitle;
- (void)setPrimitiveHelpTitle:(NSString*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSString*)primitiveMessage;
- (void)setPrimitiveMessage:(NSString*)value;




- (NSString*)primitivePostingUser;
- (void)setPrimitivePostingUser:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;





- (Done*)primitiveDone;
- (void)setPrimitiveDone:(Done*)value;



- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;


@end
