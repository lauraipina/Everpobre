//
//  AGTCoreDataStack.h
//
//  Created by Fernando Rodríguez Romero on 1/24/13.
//  Copyright (c) 2013 Agbo. All rights reserved.
//


@import Foundation;
@import CoreData;
@class NSManagedObjectContext;

@interface AGTCoreDataStack : NSObject

@property (strong, nonatomic, readonly) NSManagedObjectContext *context;

+(NSString *) persistentStoreCoordinatorErrorNotificationName;

//Crea la BD en Documents con otro nombre que no sea el modelo
+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                               databaseFilename:(NSString*) aDBName;

//Crea la BD en Documents con el nombre del modelo
+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName;

//Crea la BD en la URL que se indique
+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                                    databaseURL:(NSURL*) aDBURL;

-(id) initWithModelName:(NSString *)aModelName
            databaseURL:(NSURL*) aDBURL;


//Elimina todos los datos de la BD
-(void) zapAllData;

-(void) saveWithErrorBlock: (void(^)(NSError *error))errorBlock;

-(NSArray *)executeFetchRequest:(NSFetchRequest *) req
                     errorBlock:(void(^)(NSError *error)) errorBlock;

@end
