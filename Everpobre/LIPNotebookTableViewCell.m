//
//  LIPNotebookTableViewCell.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPNotebookTableViewCell.h"

@implementation LIPNotebookTableViewCell

+(CGFloat)height{
    
    return 60.0f;
}

+(NSString *)cellId{
    
    return [self description];
    
}

//CORE DATA - no se usa
- (void)awakeFromNib {
    // Initialization code
}

//Aqui te avisan si te están seleccionando la celda o no --> para cambiar las fuentes, etc.. al seleccionar
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
