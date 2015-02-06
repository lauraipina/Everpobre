// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LIPPhotoContainer.m instead.

#import "_LIPPhotoContainer.h"

const struct LIPPhotoContainerAttributes LIPPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct LIPPhotoContainerRelationships LIPPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation LIPPhotoContainerID
@end

@implementation _LIPPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (LIPPhotoContainerID*)objectID {
	return (LIPPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

