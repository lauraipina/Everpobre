//
//  LIPNotesTableViewCell.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

@import UIKit;

@class LIPNote;

@interface LIPNameTableViewCell : UITableViewCell


+(CGFloat)height;
+(NSString *)cellId;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (nonatomic, strong) LIPNote *note;

//referencia para observar la nota
-(void) setNote:(LIPNote *) note;

@end
