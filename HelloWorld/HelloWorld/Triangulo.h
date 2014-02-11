//
//  Triangulo.h
//  HelloWorld
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Triangulo : NSObject
{
    int cateto1;
    int cateto2;
}

-(float)calcularHipotenusa;
-(float) cateto1;
-(void)setCateto1:(float)novoCateto;
-(float) cateto2;
-(void)setCateto2:(float)novoCateto;
@end
