// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LIPNote.m instead.

#import "_LIPNote.h"

const struct LIPNoteAttributes LIPNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct LIPNoteRelationships LIPNoteRelationships = {
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation LIPNoteID
@end

@implementation _LIPNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (LIPNoteID*)objectID {
	return (LIPNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic notebook;

@dynamic photo;

@end

