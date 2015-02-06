//
//  LIPTextTableViewCell.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LIPNote;

@interface LIPTextTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString *)cellId;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) LIPNote *note;

@end
