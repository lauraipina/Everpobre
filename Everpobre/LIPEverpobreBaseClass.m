//
//  LIPEverpobreBaseClass.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 3/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPEverpobreBaseClass.h"

@implementation LIPEverpobreBaseClass

#pragma mark - Lifecycle
-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    
    //Se llama una vez en la vida
    [self setupKVO];
    
}

-(void) awakeFromFetch{
    
    [super awakeFromFetch];
    
    //Se llama muchas veces
    [self setupKVO];
}

-(void) willTurnIntoFault{
    
    [super willTurnIntoFault];
    
    //Desmontamos el chiringo - nos damos de baja de todas las notificaciones
    [self tearDownKVO];
    
}


#pragma mark - KVO
-(void)setupKVO{
    
    //Alta en notificaciones para las propiedades
    //que quiero observar
    
    //Yo mismo soy el que está observando (self)
    //forKeyPath --> quiero ver las propiedades que indico aqui
    //options --> si quieres recibir mas informacion: valor nuevo (KSKeyValueObservingOptionNew) "o"(no logico) valor viejo (KSKeyValueObservingOptionNew), en este caso
    //  pero pueden ser otros (no nos hace falta --> los ponemos a cero)
    //context --> null porque es el puntero a void nulo, no nill --> OJO!!
    
    //Por cada clave que me va a devolver el metodo "observableKeys"
    for (NSString *key in [self observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:0
                  context:NULL];
        
    }
    
}

-(void)tearDownKVO{
    
    //Baja en todas las listas de Spam
    for (NSString *key in [self observableKeys]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
}

#pragma mark - Utils
-(NSArray *)observableKeys{
    
    //Grupo de constantes a observar : uno de atributos y otro de relaciones!!
    return nil;
}


@end
