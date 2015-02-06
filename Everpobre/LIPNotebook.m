#import "LIPNotebook.h"

@interface LIPNotebook ()

// Private interface goes here.

@end

@implementation LIPNotebook

// Custom logic goes here.
+(instancetype) notebookWithName: (NSString *)name context:(NSManagedObjectContext *)context{
    
    //Asignamos valores a las propiedades
    LIPNotebook *nb = [self insertInManagedObjectContext:context];
    
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
    
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

#pragma mark - Utils
-(NSArray *)observableKeys{
    
    //Grupo de constantes a observar : uno de atributos y otro de relaciones!!
    return @[LIPNotebookAttributes.name,
             LIPNotebookRelationships.notes];
}


@end
