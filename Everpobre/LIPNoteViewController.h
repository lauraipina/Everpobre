//
//  LIPNoteViewController.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LIPNote;

@interface LIPNoteViewController : UITableViewController

@property (nonatomic, strong) LIPNote *note;

-(id) initWithModel:(LIPNote *) model;


@end
