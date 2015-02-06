#import "LIPNote.h"
#import "LIPNotebook.h"
#import "LIPPhotoContainer.h"

@interface LIPNote ()

// Private interface goes here.

@end

@implementation LIPNote

// Custom logic goes here.


#pragma mark - Methods class

+(instancetype) noteWithName:(NSString *)name
                    notebook:(LIPNotebook *) notebook
                     context:(NSManagedObjectContext *)context{
    
    LIPNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.photo = [LIPPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    return note;
}



#pragma mark - Utils
-(NSArray *)observableKeys{
    
    //Grupo de constantes a observar : uno de atributos y otro de relaciones!!
    return @[LIPNoteAttributes.name,
             LIPNoteAttributes.text,
             LIPNoteRelationships.notebook,
             LIPNoteRelationships.photo,
             @"photo.photoData"]; //no tengo constante para photo del container --> pero puede cambiar el photoData
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //Actualizamos los datos que hemos observado que han cambiado
    //keyPath es la propiedad que se ha modificado
    
    //Solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}


@end
