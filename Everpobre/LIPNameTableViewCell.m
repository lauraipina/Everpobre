//
//  LIPNotesTableViewCell.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPNameTableViewCell.h"
#import "LIPNote.h"


//Para observar desde la celda la nota --> interface y property
@interface LIPNameTableViewCell ()


@end

@implementation LIPNameTableViewCell


#pragma mark - Properties
//SETTER personalizado
-(void) setNote:(LIPNote *)note{
    
    //Sincronizamos la vista con la nota
    self.nameField.text = note.name;
    
    //guardamos la nota
    _note = note;
}

#pragma mark - Methods Class
+(CGFloat)height{
    
    return 44.0f;
}

+(NSString *)cellId{
    
    return [self description];
}



#pragma mark - KVO
//referencia para observar la nota

//Si se empieza a observar, hay que tener un metodo para darse de baja --> es VITAL!!
//Es un metodo que te manda la tabla, cuando la celda desaparece --> para cuando se vaya a reutilizar una celda, mandará antes este metodo para poner todo a cero y comenzar de nuevo -->>>  RESETEA LA CELDA para tenerla preparada
-(void) prepareForReuse{
    
    [super prepareForReuse];
    
    //Cuando desaparezco, me mandan este mensaje
    //para que me resetee y me prepare para ser reutilizado
    //algo asi como un viewWillDisappear para celdas
    
    //Me voy a dar de baja de las notificaciones KVO
    
    //sincroniza la vista con la nota por si hubo cambios
    self.note.name = self.nameField.text;
    
    
    
}

//Comprueba que se cambia
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
