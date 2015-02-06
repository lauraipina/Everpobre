//
//  PhotoViewController.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LIPNote;

@interface LIPPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)deletePhoto:(id)sender;

- (IBAction)takePhoto:(id)sender;

@property (nonatomic, strong) LIPNote *note;
-(id) initWithModel:(LIPNote *) note;

@end
