//
//  Triangulo.m
//  HelloWorld
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Triangulo.h"
#import <math.h>



@implementation Triangulo


-(float)calcularHipotenusa
{
    float aux = pow(cateto1,2)+pow(cateto2,2);
    
    float hipotenusa = sqrt(aux);
    
    return hipotenusa;

}

-(float) cateto1
{
    return cateto1;
}

-(void)setCateto1:(float)novoCateto
{
    cateto1 = novoCateto;
}


-(float) cateto2
{
    return cateto2;
}

-(void)setCateto2:(float)novoCateto
{
    cateto2 = novoCateto;
}

@end
