// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LIPPhotoContainer.h instead.

@import CoreData;

extern const struct LIPPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} LIPPhotoContainerAttributes;

extern const struct LIPPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} LIPPhotoContainerRelationships;

@class LIPNote;

@interface LIPPhotoContainerID : NSManagedObjectID {}
@end

@interface _LIPPhotoContainer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LIPPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _LIPPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(LIPNote*)value_;
- (void)removeNotesObject:(LIPNote*)value_;

@end

@interface _LIPPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
