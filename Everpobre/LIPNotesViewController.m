//
//  LIPNotesViewController.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 4/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPNotesViewController.h"
#import "LIPNote.h"
#import "LIPPhotoContainer.h"
#import "LIPNoteViewController.h"

@interface LIPNotesViewController ()

@end

@implementation LIPNotesViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Agregamos boton de añadir notas
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                       target:self
                                                                       action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = b;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.
    self.title = self.notebook.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar la nota
    LIPNote *n =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Creamos la celda si no existe
    static NSString *cellId = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //La configuramos
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];
    
    //Devolvemos la celda
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar si el pollo quiere eliminar celda
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Borramos la libreta, pero ¿cual?
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        LIPNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

//Para cambiar el texto del botón eliminar
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove";
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar la nota
    LIPNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //Crear formulario de nota
    LIPNoteViewController *nVC = [[LIPNoteViewController alloc] initWithModel:note];
    
    //Hacer el push
    [self.navigationController pushViewController:nVC animated:YES];
    
    
}

#pragma mark - Actions

-(void) addNote:(id) sender{
    
    //Creamos nota
    [LIPNote noteWithName:@"Nueva Nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
    
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
