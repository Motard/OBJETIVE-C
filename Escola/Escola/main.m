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

    @autoreleasepool
    {
        
        Utilizador * utilizador = [[Utilizador alloc]init];
        NSMutableDictionary * myUtilizadores = [[NSMutableDictionary alloc]init];
        char nomeUtilizador[20];
        int numero;
        char password[10];
        char siglaCurso[5];
        Utilizador * utilizadorLogedIn;
        int opcaoMenuEscolhida;
        int numeroUtilizadores;
        NSString * chave;
        
        
//      Criar o admin
        utilizador.numeroUtilizador = 9999;
        utilizador.nomeUtilizador = @"admin";
        utilizador.password = @"sa";
        utilizador.siglaCurso = @"admin";
        utilizador.tipoUtilizador = 9;
        
//      Inserir o admin no Dictionary de utilizadores
        [myUtilizadores setValue:utilizador forKey:[NSString stringWithFormat:@"%d",utilizador.numeroUtilizador]];
        
        
//      Ciclo infinito até o administrador sair do programa
        while(1)
        {
            //      Ciclo infinito enquanto o numero e password nao baterem certo
            while (1)
            {
                //      Fazer o login
                NSLog(@"Introduza o numero");
                scanf("%d",&numero);
                NSLog(@"Introduza a password");
                scanf("%s",password);
                
                //      Procurar o utilizador no Dictionary
                utilizadorLogedIn = [myUtilizadores objectForKey:[NSString stringWithFormat:@"%d",numero]];
                
                if (!utilizadorLogedIn)
                    NSLog(@"Utilizador nao existe");
                else
                {
                    if ([utilizadorLogedIn.password isEqualToString:[[NSString alloc] initWithCString:password encoding:NSUTF8StringEncoding]])
                    {
                        break;
                    }
                    else
                        NSLog(@"Password errada");
                    
                }
            }
            
            //      Ciclo infinito até o utilizador fazer log off
            do
            {
                //      Menu de opções
                switch (utilizadorLogedIn.tipoUtilizador)
                {
                    //      Menu do Professor
                    case 1:
                        do
                        {
                            NSLog(@"Bem vindo Professor");
                            NSLog(@"Escolha opcao \n 1 - Lançar pautas\n 2 - Lançar notas\n 0 - Log Off");
                            scanf("%d",&opcaoMenuEscolhida);
                            
                        } while (opcaoMenuEscolhida<0 || opcaoMenuEscolhida>2);
                        break;
                    
                    //      Menu do Aluno
                    case 2:
                        do
                        {
                            NSLog(@"Bem vindo Aluno");
                            NSLog(@"Escolha opcao \n 1 - Ver notas\n 2 - Ver média\n 3 - Módulos em atraso\n 0 - Log Off");
                            scanf("%d",&opcaoMenuEscolhida);
                            
                        } while (opcaoMenuEscolhida<0 || opcaoMenuEscolhida>3);
                        break;
                        
                    //      Menu do Admin
                    case 9:
                        do
                        {
                            NSLog(@"Bem vindo Administrador");
                            NSLog(@"Escolha opcao \n 1 - Criar professor\n 2 - Criar aluno\n 3 - Criar disciplina\n 4 - Listar professores\n 0 - Log Off\n 9 - Sair do programa");
                            scanf("%d",&opcaoMenuEscolhida);
                            
                        } while (opcaoMenuEscolhida<0 || opcaoMenuEscolhida>9);
                        break;
                }
                
                //      Bloco de tarefas por utilizador
                switch (utilizadorLogedIn.tipoUtilizador)
                {
                        //      Tarefas do admin
                    case 9:
                        switch (opcaoMenuEscolhida)
                    {
                            //      Criar professor
                        case 1:
                            //      Input dados
                            NSLog(@"Introduza o nome do professor");
                            scanf("%s",nomeUtilizador);
                            NSLog(@"Introduza o numero do professor");
                            scanf("%d",&numero);
                            NSLog(@"Introduza a password");
                            scanf("%s",password);
                            NSLog(@"Introduza a sigla do curso");
                            scanf("%s",siglaCurso);
                            
                            //      Criar uma nova posição de memoria para guardar um utilizador
                            utilizador = [[Utilizador alloc]init];
                            
                            //      Afetar as variaveis de classe do tipo utilizador com o novo utilizador
                            utilizador.nomeUtilizador = [NSString stringWithFormat:@"%s",nomeUtilizador];
                            utilizador.numeroUtilizador = numero;
                            utilizador.password = [NSString stringWithFormat:@"%s",password];
                            utilizador.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            utilizador.tipoUtilizador = 1;
                            
                            //      Inserir o utilizador no Dictionary de utilizadores
                            [myUtilizadores setValue:utilizador forKey:[NSString stringWithFormat:@"%d",utilizador.numeroUtilizador]];
                            break;
                            
                            //      Criar aluno
                        case 2:
                            //      Input dados
                            NSLog(@"Introduza o nome do aluno");
                            scanf("%s",nomeUtilizador);
                            NSLog(@"Introduza o numero do aluno");
                            scanf("%d",&numero);
                            NSLog(@"Introduza a password");
                            scanf("%s",password);
                            NSLog(@"Introduza a sigla do curso");
                            scanf("%s",siglaCurso);
                            
                            //      Criar uma nova posição de memoria para guardar um utilizador
                            utilizador = [[Utilizador alloc]init];
                            
                            //      Afetar as variaveis de classe do tipo utilizador com o novo utilizador
                            utilizador.nomeUtilizador = [NSString stringWithFormat:@"%s",nomeUtilizador];
                            utilizador.numeroUtilizador = numero;
                            utilizador.password = [NSString stringWithFormat:@"%s",password];
                            utilizador.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            utilizador.tipoUtilizador = 2;
                            
                            //      Inserir o utilizador no Dictionary de utilizadores
                            [myUtilizadores setValue:utilizador forKey:[NSString stringWithFormat:@"%d",utilizador.numeroUtilizador]];
                            break;
                            
                            //      Listar utilizadores
                        case 4:
                            for (NSString * chave in myUtilizadores);
                        {
                            Utilizador * value = [myUtilizadores objectForKey:chave];
                            NSLog(@"%@",value.nomeUtilizador);
                            NSLog(@"hello");
                            //utilizador = [myUtilizadores objectForKey:value];
                            
                            //NSLog(@"%@",utilizador.nomeUtilizador);
                            
                        }
                            break;
                    }
                        break;
                        
                    default:
                        break;
                }
            }
            while (opcaoMenuEscolhida!=0 && opcaoMenuEscolhida!=9);
            if (utilizadorLogedIn.tipoUtilizador==9 && opcaoMenuEscolhida==9)
                break;
        }
        
        return 0;
    }
}
