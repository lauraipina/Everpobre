//
//  LIPNotebookTableViewCell.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIPNotebookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *notesView;

//CGFloat = Numero de coma flotante
+(CGFloat)height;
+(NSString *)cellId;

@end
