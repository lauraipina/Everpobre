//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Laura Iglesias Piña on 4/2/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)


-(UINavigationController *) lipWrappedNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    
    //Me devuelvo a mi mismo dentro de un navigationController
    [nav pushViewController:self
                   animated:NO];
    
    return nav;
}

@end
