//
//  PhotoViewController.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 5/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPPhotoViewController.h"
#import "LIPNote.h"
#import "LIPPhotoContainer.h"

@interface LIPPhotoViewController ()

@end

@implementation LIPPhotoViewController


-(id) initWithModel:(LIPNote *) note{
    
    if (self == [super initWithNibName:nil bundle:nil]) {
        _note = note;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //sincronizamos modelo con vista
    self.photoView.image = self.note.photo.image;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //sincronizamos vista con modelo
    self.note.photo.image = self.photoView.image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deletePhoto:(id)sender {
}

- (IBAction)takePhoto:(id)sender {
}
@end
