//
//  main.m
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilizador.h"
#import "Disciplina.h"

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
        
//      Variáveis para as disciplinas
        char nomeDisciplina[20];
        char siglaDisciplina[5];
        int quantidadeModulos;
        Disciplina * disciplina;
        NSMutableDictionary * myDisciplinas = [[NSMutableDictionary alloc]init];
        
        Utilizador * obj = [[Utilizador alloc]init];
        NSArray * chaves;
        
        
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
                //      Bloco dos menus por utilizador
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
                            NSLog(@"Escolha opcao \n 1 - Criar professor\n 2 - Criar aluno\n 3 - Criar disciplina\n 4 - Listar utilizadores\n 0 - Log Off\n 9 - Sair do programa");
                            scanf("%d",&opcaoMenuEscolhida);
                            
                        } while (opcaoMenuEscolhida<0 || opcaoMenuEscolhida>9);
                        break;
                }
                
                //      Bloco de tarefas por utilizador
                switch (utilizadorLogedIn.tipoUtilizador)
                {
                    //      Tarefas do professor
                    case 1:
                        switch (opcaoMenuEscolhida)
                        {
                            //      Lançar Pautas
                            case 1:
                                
                                break;
                                
                            //      Lançar Notas
                            case 2:
                                //      Apresentar todos os alunos para permitir identificar o aluno que vai receber as notas
                                //      Criar um NSArray com todas as chaves do NSMutableDictionary
                                chaves = [myUtilizadores allKeys];
                                

                                //      Iterar todas as posições do novo array e listar todos os alunos
                                for (int i=0; i<[chaves count]; i++)
                                {
                                    obj = [myUtilizadores objectForKey:chaves[i]];
                                    if (obj.tipoUtilizador == 1 || obj.tipoUtilizador == 9)
                                        continue;
                                    NSLog(@"Nome - %@ / Numero - %d", obj.nomeUtilizador, obj.numeroUtilizador);
                                }
                                
                                break;
                        }
                        break;
                        
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
                            
                            NSLog(@"Professor criado com sucesso");
                            break;
                            
                        //      Criar aluno
                        case 2:
                            //      Input dados aluno
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
                            
                            //      Afetar as variaveis de classe do tipo Utilizador com o novo utilizador
                            utilizador.nomeUtilizador = [NSString stringWithFormat:@"%s",nomeUtilizador];
                            utilizador.numeroUtilizador = numero;
                            utilizador.password = [NSString stringWithFormat:@"%s",password];
                            utilizador.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            utilizador.tipoUtilizador = 2;
                            
                            //      Inserir o utilizador no Dictionary de utilizadores
                            [myUtilizadores setValue:utilizador forKey:[NSString stringWithFormat:@"%d",utilizador.numeroUtilizador]];
                            
                            NSLog(@"Aluno criado com sucesso");
                            break;
                            
                        //      Criar disciplinas
                        case 3:
                            //      Input dados da disciplina
                            NSLog(@"Introduza o nome da disciplina");
                            scanf("%s",nomeDisciplina);
                            NSLog(@"Introduza a sigla da disciplina");
                            scanf("%s",siglaDisciplina);
                            NSLog(@"Introduza a sigla do curso");
                            scanf("%s",siglaCurso);
                            NSLog(@"Introduza a quantidade de módulos");
                            scanf("%d",&quantidadeModulos);
                            
                            //      Criar uma nova posicao de memoria para guardar uma disciplina
                            disciplina = [[Disciplina alloc]init];
                            
                            //      Afetar as variáveis de classe do tipo Disciplina com a nova disciplina
                            disciplina.nomeDisciplina = [NSString stringWithFormat:@"%s",nomeDisciplina];
                            disciplina.siglaDisciplina = [NSString stringWithFormat:@"%s",siglaDisciplina];
                            disciplina.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            disciplina.qtdModulos = quantidadeModulos;
                            
                            //      Inserir a disciplina no Dictionary de disciplinas
                            [myDisciplinas setValue:disciplina forKey:disciplina.nomeDisciplina];
                            
                            NSLog(@"Disciplina criada com sucesso");
                            break;
                            
                        //      Listar utilizadores
                        case 4:
                            
//                            
//                            for (obj in [myUtilizadores allValues]);
//                            {
//                                //obj = [[Utilizador alloc]init];
//                                //Utilizador * valor = [myUtilizadores objectForKey:chave];
//                                NSString * xpto = obj.nomeUtilizador;
//                                NSLog(@"%@",xpto);
//                                NSLog(@"hello");
//                                //utilizador = [myUtilizadores objectForKey:value];
//                                
//                                //NSLog(@"%@",utilizador.nomeUtilizador);
//
                            
                            //}
                            //      Criar um NSArray com todas as chaves do NSMutableDictionary
                            chaves = [myUtilizadores allKeys];
                            
                            //      Iterar todas as posições do novo array e listar todos utilizadores
                            for (int i=0; i<[chaves count]; i++)
                            {
                                obj = [myUtilizadores objectForKey:chaves[i]];
                                NSLog(@"Nome - %@ / Numero - %d / Tipo - %d", obj.nomeUtilizador, obj.numeroUtilizador, obj.tipoUtilizador);
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
