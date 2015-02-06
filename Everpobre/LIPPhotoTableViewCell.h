//
//  LIPPhotoTableViewCell.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LIPNote;

@interface LIPPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

+(CGFloat)height;
+(NSString *)cellId;

@property (nonatomic, strong) LIPNote *note;


@end
