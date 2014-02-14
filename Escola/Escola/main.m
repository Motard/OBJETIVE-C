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
#import "Nota.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
//      Variáveis para os utilizadores
        Utilizador * utilizadorObj = [[Utilizador alloc]init];
        NSMutableDictionary * myUtilizadoresDic = [[NSMutableDictionary alloc]init];
        char nomeUtilizador[20];
        int numeroUtilizador;
        char password[10];
        char siglaCurso[5];
        Utilizador * utilizadorLogedIn;
        int opcaoMenuEscolhida;
        
//      Variáveis para as disciplinas
        char nomeDisciplina[20];
        char siglaDisciplina[5];
        int quantidadeModulos;
        Disciplina * disciplinaObj;
        NSMutableDictionary * myDisciplinasDic = [[NSMutableDictionary alloc]init];
        
//      Variáveis para as notas
        int numeroModulo;
        int nota;
        NSMutableArray * myNotasArr = [[NSMutableArray alloc]init];
        Nota * notaObj;
        
        Utilizador * obj = [[Utilizador alloc]init];
        
  
        
        
//      Criar o admin
        utilizadorObj.numeroUtilizador = 99;
        utilizadorObj.nomeUtilizador = @"admin";
        utilizadorObj.password = @"sa";
        utilizadorObj.siglaCurso = @"admin";
        utilizadorObj.tipoUtilizador = 9;
        
//      Inserir o admin no Dictionary de utilizadores
        [myUtilizadoresDic setValue:utilizadorObj forKey:[NSString stringWithFormat:@"%d",utilizadorObj.numeroUtilizador]];
        
        
//      Ciclo infinito até o administrador sair do programa
        while(1)
        {
            //      Ciclo infinito enquanto o numero e password nao baterem certo
            while (1)
            {
                //      Fazer o login
                NSLog(@"Introduza o numero");
                scanf("%d",&numeroUtilizador);
                NSLog(@"Introduza a password");
                scanf("%s",password);
                
                //      Procurar o utilizador no Dictionary
                utilizadorLogedIn = [myUtilizadoresDic objectForKey:[NSString stringWithFormat:@"%d",numeroUtilizador]];
                
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
                                for (NSString * chave in myUtilizadoresDic)
                                {
                                    obj = [myUtilizadoresDic objectForKey:chave];
                                    if (obj.tipoUtilizador == 1 || obj.tipoUtilizador == 9)
                                    {
                                        obj=nil;
                                        continue;
                                    }
                                    NSLog(@"Nome - %@ / Numero - %d", obj.nomeUtilizador, obj.numeroUtilizador);
                                }
                                
                                //      Se não existirem alunos não é possivel introduzir notas
                                if(!obj)
                                {
                                    NSLog(@"Necessário criar alunos primeiro");
                                    break;
                                }
                                
                                //      Apresentar todas as diciplinas para permitir identificar a sigla da disciplina
                                disciplinaObj = nil;    //  Senão existirem disciplinas esta variavel continua nill
                                for (NSString * chaves in myDisciplinasDic)
                                {
                                    disciplinaObj = [myDisciplinasDic objectForKey:chaves];
                                    NSLog(@"Nome disciplina - %@",disciplinaObj.siglaDisciplina);
                                }
                                
                                //      Se não existirem disciplinas não é possivel introduzir notas
                                if(!disciplinaObj)
                                {
                                    NSLog(@"Necessário criar disciplinas primeiro");
                                    break;
                                }
                                
                                //      Input dados
                                NSLog(@"Introduza o numero do aluno");
                                scanf("%d",&numeroUtilizador);
                                NSLog(@"Introduza a sigla da disciplina");
                                scanf("%s",siglaDisciplina);
                                NSLog(@"Introduza o numero do modulo");
                                scanf("%d",&numeroModulo);
                                
                                //      Obrigar a nota a ser entre 0 e 20
                                do
                                {
                                    NSLog(@"Introduza a nota");
                                    scanf("%d",&nota);
                                    
                                    if (nota<0 || nota>20)
                                        NSLog(@"A nota tem de ser valor entre 0 e 20");
                                } while (nota<0 || nota>20);
                                
                                //      Criar um novo objecto do tipo Nota
                                notaObj = [[Nota alloc]init];
                                
                                //      Afetar as variáveis da classe Nota com os inputs
                                notaObj.numeroAluno = numeroUtilizador;
                                notaObj.siglaDisciplina = [NSString stringWithFormat:@"%s",siglaDisciplina];
                                notaObj.numeroModulo = numeroModulo;
                                notaObj.nota = nota;
                                
                                //      Inserir o objecto Nota no array
                                [myNotasArr addObject:notaObj];
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
                           
                            //      Verifica se o numero introduzido já existe
                            do
                            {
                                NSLog(@"Introduza o numero do professor");
                                scanf("%d",&numeroUtilizador);
                                
                                obj = [myUtilizadoresDic objectForKey:[NSString stringWithFormat:@"%d",numeroUtilizador]];
                                
                                if(obj)
                                    NSLog(@"Esse numero já existe");
                            }
                            while (obj);
                            NSLog(@"Introduza a password");
                            scanf("%s",password);
                            NSLog(@"Introduza a sigla do curso");
                            scanf("%s",siglaCurso);
                            
                            //      Criar uma nova posição de memoria para guardar um utilizador
                            utilizadorObj = [[Utilizador alloc]init];
                            
                            //      Afetar as variaveis de classe do tipo utilizador com o novo utilizador
                            utilizadorObj.nomeUtilizador = [NSString stringWithFormat:@"%s",nomeUtilizador];
                            utilizadorObj.numeroUtilizador = numeroUtilizador;
                            utilizadorObj.password = [NSString stringWithFormat:@"%s",password];
                            utilizadorObj.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            utilizadorObj.tipoUtilizador = 1;
                            
                            //      Inserir o utilizador no Dictionary de utilizadores
                            [myUtilizadoresDic setValue:utilizadorObj forKey:[NSString stringWithFormat:@"%d",utilizadorObj.numeroUtilizador]];
                            
                            NSLog(@"Professor criado com sucesso");
                            break;
                            
                        //      Criar aluno
                        case 2:
                            //      Input dados aluno
                            NSLog(@"Introduza o nome do aluno");
                            scanf("%s",nomeUtilizador);
                            
                            //      Verifica se o numero introduzido já existe
                            do
                            {
                                NSLog(@"Introduza o numero do aluno");
                                scanf("%d",&numeroUtilizador);
                                
                                obj = [myUtilizadoresDic objectForKey:[NSString stringWithFormat:@"%d",numeroUtilizador]];
                                
                                if(obj)
                                    NSLog(@"Esse numero já existe");
                            }
                            while (obj);
                            NSLog(@"Introduza a password");
                            scanf("%s",password);
                            NSLog(@"Introduza a sigla do curso");
                            scanf("%s",siglaCurso);
                            
                            //      Criar uma nova posição de memoria para guardar um utilizador
                            utilizadorObj = [[Utilizador alloc]init];
                            
                            //      Afetar as variaveis de classe do tipo Utilizador com o novo utilizador
                            utilizadorObj.nomeUtilizador = [NSString stringWithFormat:@"%s",nomeUtilizador];
                            utilizadorObj.numeroUtilizador = numeroUtilizador;
                            utilizadorObj.password = [NSString stringWithFormat:@"%s",password];
                            utilizadorObj.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            utilizadorObj.tipoUtilizador = 2;
                            
                            //      Inserir o utilizador no Dictionary de utilizadores
                            [myUtilizadoresDic setValue:utilizadorObj forKey:[NSString stringWithFormat:@"%d",utilizadorObj.numeroUtilizador]];
                            
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
                            disciplinaObj = [[Disciplina alloc]init];
                            
                            //      Afetar as variáveis de classe do tipo Disciplina com a nova disciplina
                            disciplinaObj.nomeDisciplina = [NSString stringWithFormat:@"%s",nomeDisciplina];
                            disciplinaObj.siglaDisciplina = [NSString stringWithFormat:@"%s",siglaDisciplina];
                            disciplinaObj.siglaCurso = [NSString stringWithFormat:@"%s",siglaCurso];
                            disciplinaObj.qtdModulos = quantidadeModulos;
                            
                            //      Inserir a disciplina no Dictionary de disciplinas
                            [myDisciplinasDic setValue:disciplinaObj forKey:disciplinaObj.nomeDisciplina];
                            
                            NSLog(@"Disciplina criada com sucesso");
                            break;
                            
                        //      Listar utilizadores
                        case 4:
                            for (NSString * chave in myUtilizadoresDic)
                            {
                                obj = [myUtilizadoresDic objectForKey:chave];
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
