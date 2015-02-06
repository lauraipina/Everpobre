//
//  AppDelegate.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 2/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "LIPNote.h"
#import "LIPNotebook.h"
#import "LIPPhotoContainer.h"
#import "LIPNotebookViewController.h"
//Todo viewController entiende el lipWrappedNavigation.. a partir de ahora al importarlo
#import "UIViewController+Navigation.h"

@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    //Creamos el stack -> se crea la BD
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    //Creamos datos chorras
    [self createDummyData];
    
    //Creamos un metodo para trastear con los datos
    //[self trastearConDatos];
    
    //Creamos el conjunto de datos
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[LIPNotebook entityName]];
    //no mas de 15 registros en la tabla
    r.fetchBatchSize = 15;
    //Ordenamos la busqueda
    r.sortDescriptors = @[[NSSortDescriptor  sortDescriptorWithKey:LIPNoteAttributes.name
                                                         ascending:YES
                                                          selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor  sortDescriptorWithKey:LIPNoteAttributes.modificationDate
                                                         ascending:NO]];
    //Creamos el FetchedResultsController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:r
                                      managedObjectContext:self.stack.context
                                      sectionNameKeyPath:nil
                                      cacheName:nil];
    
    //Creamos el controlador
    LIPNotebookViewController *nbVC = [[LIPNotebookViewController alloc]
                                      initWithFetchedResultsController:fc
                                                                style:UITableViewStylePlain];
    
    //Lo metemos en un NavigationController
    // UINavigationController *nav = [[UINavigationController alloc] nbVC];
    
    //Lo mostramos
    //self.window.rootViewController = nav;
    //Lo hacemos con CATEGORIAS para ver como funcionan
    self.window.rootViewController = [nbVC lipWrappedNavigation];
    
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils
-(void) createDummyData{
    
    //Borrar todo lo que haya, para empezar de cero
    [self.stack zapAllData];
    
    //Creamos la agenda
    LIPNotebook *nb = [LIPNotebook notebookWithName:@"Ex-novios para el recuerdo"
                                            context:self.stack.context];
    
    //Creamos las notas de esa agenda
    [LIPNote noteWithName:@"Jon Kortajarena 1"
                 notebook:nb
                  context:self.stack.context];
    
    [LIPNote noteWithName:@"Jon Kortajarena 2"
                 notebook:nb
                  context:self.stack.context];
    
    [LIPNote noteWithName:@"Jon Kortajarena 3"
                 notebook:nb
                  context:self.stack.context];
    
    //fisgoneamos
    NSLog(@"Libreta: %@", nb);
    NSLog(@"Exs: %@", nb.notes);
    
}

-(void) trastearConDatos{
    
    //Creamos la agenda
    LIPNotebook *apps = [LIPNotebook notebookWithName:@"Ideas de Apps"
                                            context:self.stack.context];
    
    //Creamos las notas de esa agenda
    LIPNote *iCachete  = [LIPNote noteWithName:@"iCachete"
                                      notebook:apps
                                       context:self.stack.context];
    
    NSLog(@"Antes: %@", iCachete.modificationDate);
    
    //Comprobar que modicationDate se actualiza
    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    
    NSLog(@"Despues: %@", iCachete.modificationDate);
    
    //** Busqueda
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[LIPNote entityName]];
    
    //Numero de busqueda
    r.fetchBatchSize = 20;
    
    //Ordena primero por el nombre y si hay un empate, por la fecha de modificacion
    //Ordena sin diferenciar mayusculas y minisculas: caseInsensitiveCompare
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LIPNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:LIPNoteAttributes.modificationDate
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)]];
    
    //NSPredicate : Es un filtro --> los que sean YES, se quedan
    //queremos solo las notas de la libreta apps
    r.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", apps];
    
    //Ejecutamos la búsqueda
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:r
                                                     error:&err];
    
    if(res == nil){
        
        //La cagamos
        NSLog(@"Error al buscar: %@", err);
        
    }
    
    //Ha ido bien
    NSLog(@"Numero de notas: %lu", (unsigned long)[res count]);
    
    //¿De verdad es un array? no tiene sentido tener tantos objetos en un array
    //Se comporta como un Array, pero por dentro no lo es.. va cogiendo los elementos, segun los necesite
    //Devuelve un:  __NSArrayI  (las clases que empiezan asi __ --> no tenemos acceso)
    NSLog(@"Clase: %@", [res class]);
    
    
    //** Borramos la libreta apps
    [self.stack.context deleteObject:apps];
    
    //Le tenemos que quitar el predicado, pq ya no tiene sentido si se va a borrar
    r.predicate = nil;
    
    
    //Borramos ---> y ejecutamos
    res = [self.stack.context executeFetchRequest:r
                                            error:&err];
    
    if(res == nil){
        //La cagamos
        NSLog(@"Error al borrar: %@", err);
    }
    
    //Si ha ido bien, se ha borrado la libreta y las notas (le indicamos que fueran en cascada)
    NSLog(@"Notas existentes: %@", res);
    
    //Al ejecutar el borrado --> se debe guardar el cambio
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar: %@", error);
    }];
    
}



@end
