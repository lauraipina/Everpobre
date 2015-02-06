//
//  LIPPhotoTableViewCell.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPPhotoTableViewCell.h"
#import "LIPNote.h"
#import "LIPPhotoContainer.h"

@implementation LIPPhotoTableViewCell

#pragma mark - Properties
//SETTER personalizado
-(void) setNote:(LIPNote *)note{
    
    //guardamos la nota
    _note = note;
    
    //sincronizamos los datos de la nota con la vista (imagen)
    self.photoView.image = note.photo.image;
    
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
    
    //guardo lo que haya escrito el usuario en la nota
    self.note.photo.image = self.photoView.image;
}



+(CGFloat)height{
    
    return 320.0f;
}

+(NSString *)cellId{
    
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
