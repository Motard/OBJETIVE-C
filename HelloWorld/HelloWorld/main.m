//
//  main.m
//  HelloWorld
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Triangulo.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {//gestao de memoria.Tudo fica dentro deste autoreleasepool
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Triangulo * triangulo = [[Triangulo alloc]init];
        
        //[triangulo setCateto1:12];      //triangulo.cateto1=12;
        //[triangulo setCateto2:15];      //triangulo.cateto2=15;
        
        NSLog(@"Indique os catetos \n - ");
        
        float cateto1, cateto2;
        
        scanf("%f %f",&cateto1,&cateto2);
        
        [triangulo setCateto1:cateto1];
        [triangulo setCateto2:cateto2];
        
        NSLog(@"%f",[triangulo calcularHipotenusa]);
        
    }
    return 0;
}

