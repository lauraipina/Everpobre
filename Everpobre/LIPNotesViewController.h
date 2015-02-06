//
//  LIPNotesViewController.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 4/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "LIPNotebook.h"

@interface LIPNotesViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) LIPNotebook *notebook;

@end
