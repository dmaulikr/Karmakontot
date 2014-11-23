// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Done.h instead.

#import <CoreData/CoreData.h>


extern const struct DoneAttributes {
	__unsafe_unretained NSString *doneId;
	__unsafe_unretained NSString *ownedBy;
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *url;
} DoneAttributes;

extern const struct DoneRelationships {
	__unsafe_unretained NSString *help;
} DoneRelationships;

extern const struct DoneFetchedProperties {
} DoneFetchedProperties;

@class Help;






@interface DoneID : NSManagedObjectID {}
@end

@interface _Done : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DoneID*)objectID;





@property (nonatomic, strong) NSNumber* doneId;



@property int32_t doneIdValue;
- (int32_t)doneIdValue;
- (void)setDoneIdValue:(int32_t)value_;

//- (BOOL)validateDoneId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ownedBy;



//- (BOOL)validateOwnedBy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Help *help;

//- (BOOL)validateHelp:(id*)value_ error:(NSError**)error_;





@end

@interface _Done (CoreDataGeneratedAccessors)

@end

@interface _Done (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDoneId;
- (void)setPrimitiveDoneId:(NSNumber*)value;

- (int32_t)primitiveDoneIdValue;
- (void)setPrimitiveDoneIdValue:(int32_t)value_;




- (NSString*)primitiveOwnedBy;
- (void)setPrimitiveOwnedBy:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;





- (Help*)primitiveHelp;
- (void)setPrimitiveHelp:(Help*)value;


@end
