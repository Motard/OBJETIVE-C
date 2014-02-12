//
//  main.m
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilizador.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Utilizador * utilizador = [[Utilizador alloc]init];
        NSMutableDictionary * myUtilizadores = [[NSMutableDictionary alloc]init];
        int numero;
        char password[10];
        Utilizador * checkUtilizador;
        
        
//      Criar o admin
        utilizador.numeroUtilizador = 9999;
        utilizador.nomeUtilizador = @"admin";
        utilizador.password = @"sa";
        utilizador.siglaCurso = @"admin";
        utilizador.tipoUtilizador = 9;
        
//      Inserir o admin no Dictionary de utilizadores
        [myUtilizadores setValue:utilizador forKey:[NSString stringWithFormat:@"%d",utilizador.numeroUtilizador]];
        
//      Ciclo infinito enquanto o numero e password nao baterem certo
        while (1)
        {
//      Fazer o login
            NSLog(@"Introduza o numero - ");
            scanf("%d",&numero);
            NSLog(@"Introduza a password");
            scanf("%s",password);
            
//      Procurar o utilizador no Dictionary
            checkUtilizador = [myUtilizadores objectForKey:[NSString stringWithFormat:@"%d",numero]];
            
            if (!checkUtilizador)
                NSLog(@"Utilizador nao existe");
            else
            {
                if ([checkUtilizador.password isEqualToString:[[NSString alloc] initWithCString:password encoding:NSUTF8StringEncoding]])
                {
                    NSLog(@"Bem vindo administrador");
                    break;
                }
                else
                    NSLog(@"Password errada");
                
            }
        }
        
//      Menu de opções
        
//      Menu do Admin
        switch (checkUtilizador.tipoUtilizador)
        {
            case 9:
                NSLog(@"Escolha opcao \n 1 - Criar utilizador\n 2 - Criar diciplina \n 9 - EXIT");
                break;
        }
    }
    return 0;
}

