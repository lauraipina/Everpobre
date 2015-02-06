#import "LIPPhotoContainer.h"

@interface LIPPhotoContainer ()

// Private interface goes here.

@end

@implementation LIPPhotoContainer

// Custom logic goes here.


//Hacemos esto por comodidad
//PROPERTY image --> sobreescribimos su getter y su setter

//GETTER personalizado
-(UIImage *)image{
    
    //Devolvemos un NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

//SETTER personalizado
-(void) setImage:(UIImage *)image{
    
    //Pasamos el UIImage a Data (0.9 es la calidad de comprensión)
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

@end
