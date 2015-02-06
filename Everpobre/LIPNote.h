#import "_LIPNote.h"

@interface LIPNote : _LIPNote {}

// Custom logic goes here.


//Crear metodos de clase
+(instancetype) noteWithName:(NSString *)name
                    notebook:(LIPNotebook *) notebook
                     context:(NSManagedObjectContext *)context;


@end
