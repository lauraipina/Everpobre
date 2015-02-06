// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LIPNote.h instead.

@import CoreData;
#import "LIPEverpobreBaseClass.h"

extern const struct LIPNoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} LIPNoteAttributes;

extern const struct LIPNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} LIPNoteRelationships;

@class LIPNotebook;
@class LIPPhotoContainer;

@interface LIPNoteID : NSManagedObjectID {}
@end

@interface _LIPNote : LIPEverpobreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LIPNoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LIPNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LIPPhotoContainer *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _LIPNote (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (LIPNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(LIPNotebook*)value;

- (LIPPhotoContainer*)primitivePhoto;
- (void)setPrimitivePhoto:(LIPPhotoContainer*)value;

@end
