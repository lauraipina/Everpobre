//
//  LIPNotebookViewController.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 4/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPNotebookViewController.h"
#import "LIPNotebook.h"
#import "LIPNotesViewController.h"
#import "LIPNote.h"
#import "LIPNotebookTableViewCell.h"

@interface LIPNotebookViewController ()

@end

@implementation LIPNotebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Everpobre";
    
    //Añado botón de nueva libreta
    //Target --> quien arranca la accion (yo mismo)
    //Action --> a quien va la accion
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                    target:self
                                                    action:@selector(addNotebook:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    //Registramos el nib de la celda
    //A la tabla --> cuando tengas que registrar una celda de algun tipo, vas a tener que hacerla de este tipo
    UINib *nib = [UINib nibWithNibName:@"LIPNotebookTableViewCell"
                                bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[LIPNotebookTableViewCell cellId]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguamos de qué libreta me hablan
    LIPNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Creo una celda estandar
    //static NSString *cellID = @"NotebookID";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //if(cell == nil){
    //    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
    //                                  reuseIdentifier:cellID];
    //}

    //Usamos otro metodo al tener la celda personalizada
    //--> ojo!! LIPNotebookTableViewCell --> NOOO: UITableViewCell
    LIPNotebookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LIPNotebookTableViewCell cellId] forIndexPath:indexPath ];
    
    
    //La configuro (sincronizo modelo-vista)
    //cell.textLabel.text = nb.name;
    cell.nameView.text = nb.name;
    cell.notesView.text = [NSString stringWithFormat:@"%lu", (unsigned long) nb.notes.count];
    
    
    //Creamos new = [[alloc] init]
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    //Ponemos fecha modificacion y numero de notas
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)", [fmt stringFromDate:nb.modificationDate], (unsigned long)nb.notes.count];
    
    //La devuelvo
    return cell;
}


//Utilizamos este metodo para indicarle la altura que queremos que tenga la celda personalizada
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [LIPNotebookTableViewCell height];
    
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar si el pollo quiere eliminar celda
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Borramos la libreta, pero ¿cual?
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        LIPNotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

//Para cambiar el texto del botón eliminar
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove";
    
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar cual fue la libreta
    LIPNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Creo la selección de datos
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[LIPNote entityName]];
    r.fetchBatchSize = 3;
    //Ordena primero por el nombre y si hay un empate, por la fecha de modificacion
    //Ordena sin diferenciar mayusculas y minisculas: caseInsensitiveCompare
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LIPNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:LIPNoteAttributes.modificationDate
                                                        ascending:NO]];
    //necesitamos un predicado
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                         managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                           sectionNameKeyPath:nil       cacheName:nil];
    
    //Creo una instancia de controlador de notas
    LIPNotesViewController *nVC = [[LIPNotesViewController alloc]
                                   initWithFetchedResultsController:fc
                                                              style:UITableViewStylePlain];
    
    //Le asigno el nombre de la libreta para que lo sepa
    nVC.notebook = nb;
    
    //Lo pusheo
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    
    
}


#pragma mark - Actions

-(void)addNotebook:(id)sender{
    
    //Todo objeto de CoreData tiene acceso a su contexto, asi que podemos crear la libreta sin pasarselo en este metodo
    [LIPNotebook notebookWithName:@"Nueva libreta"
                          context:self.fetchedResultsController.managedObjectContext];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
