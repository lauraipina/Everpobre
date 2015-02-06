//
//  LIPDateTableViewCell.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPDateTableViewCell.h"
#import "LIPNote.h"

@implementation LIPDateTableViewCell

-(void) setNote:(LIPNote *)note{
    
    //guardo la nota
    _note = note;
    
    //observamos las propiedades de la nota y cuando cambia, mostramos la modificationDate con la nueva fecha
    [self.note addObserver:self
                forKeyPath:LIPNoteAttributes.modificationDate
                   options:0
                   context:NULL];
}

//Darse de baja de la observacion
-(void)prepareForReuse{
    
    //Hay que darse de baja de las notificaciones KVO
    [self.note removeObserver:self
                   forKeyPath:LIPNoteAttributes.modificationDate];
    
}

//Contexto = cualquier cosa
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //sincronizamos el nuevo valor de modificationDate
    [self syncNoteWithView];
    
}

-(void)syncNoteWithView{
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle = NSDateIntervalFormatterFullStyle; //para ver los milisegundos
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
    
}

+(CGFloat)height{
    
    return 44.0f;
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
