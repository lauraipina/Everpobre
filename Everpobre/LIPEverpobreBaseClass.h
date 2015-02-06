//
//  LIPEverpobreBaseClass.h
//  Everpobre
//
//  Created by Laura Iglesias Piña on 3/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

@import CoreData;

@interface LIPEverpobreBaseClass : NSManagedObject

-(NSArray *)observableKeys;
-(void)setupKVO;
-(void)tearDownKVO;

@end
