//
//  LIPNoteViewController.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPNoteViewController.h"
#import "LIPNote.h"
//Importamos las vistas
#import "LIPPhotoTableViewCell.h"
#import "LIPTextTableViewCell.h"
#import "LIPDateTableViewCell.h"
#import "LIPNameTableViewCell.h"
#import "LIPPhotoViewController.h"

//Constantes
#define NUMBER_OF_SECTIONS  4
#define NAME_SECTION_HEADER     @"Name"
#define DATES_SECTION_HEADER    @"Creation & Modification Date"
#define TEXT_SECTION_HEADER     @"Text"
#define PHOTO_SECTION_HEADER    @"Photo"
#define NAME_SECTION    0
#define DATES_SECTION   1
#define TEXT_SECTION    2
#define PHOTO_SECTION   3

@interface LIPNoteViewController ()

@end

@implementation LIPNoteViewController

-(id) initWithModel:(LIPNote *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _note = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Registrar las celdas
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
        
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
            
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
            
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
            
        default:
            [NSException raise:@"Section no existe" format:nil]; //Creamos una excepción
            return @"Esto no existe";
            break;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return [LIPNameTableViewCell height];
            break;
            
        case DATES_SECTION:
            return [LIPDateTableViewCell height];
            break;
            
        case TEXT_SECTION:
            return [LIPTextTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [LIPPhotoTableViewCell height];
            break;
            
        default:
            [NSException raise:@"Section no existe" format:nil]; //Creamos una excepción
            return 0;
            break;
    }

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    //Averiguamos de que celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:
        {
        
            LIPNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LIPNameTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case DATES_SECTION:
        {
            LIPDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LIPDateTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case TEXT_SECTION:
        {
            LIPTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LIPTextTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case PHOTO_SECTION:
        {
            LIPPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LIPPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        default:
            [NSException raise:@"No section"
                        format:@"No section %d", indexPath.section];
            return nil;
            break;
    }

    return nil;

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == PHOTO_SECTION) {
        
        //Mostramos el controlador de fotos
        LIPPhotoViewController *pVC = [[LIPPhotoViewController alloc] initWithModel:self.note];
        
        [self.navigationController pushViewController:pVC
                                             animated:YES];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//La celda va a observar como se cambia el modelo y se va a actualizar (rompe el modelo MVC)
-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    //
    UINib *nameNib = [UINib nibWithNibName:@"LIPNameTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[LIPNameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"LIPDateTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[LIPDateTableViewCell cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"LIPTextTableViewCell" bundle:main];
    [self.tableView registerNib:textNib forCellReuseIdentifier:[LIPTextTableViewCell cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"LIPPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[LIPPhotoTableViewCell cellId]];
    
}

@end
