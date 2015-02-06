#import "_LIPNotebook.h"

@interface LIPNotebook : _LIPNotebook {}

// Custom logic goes here.
+(instancetype) notebookWithName: (NSString *)name
                         context:(NSManagedObjectContext *)context;

@end
