//
//  main.m
//  Alunos
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Disciplinas.h"
#import "Alunos.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Alunos * myAluno = [[Alunos alloc]init];
        Disciplinas * myDisciplina;
        NSMutableArray * xpto  = [[NSMutableArray alloc]init];
        
        NSLog(@"Introduza o seu nome");
        
        //fflush(stdin);
        
        char nomeAluno [15];
        scanf("%s",nomeAluno);
        //NSString * nomeAluno=[[NSString alloc] initWithCString:aux encoding:NSUTF8StringEncoding];
        myAluno.nome = [[NSString alloc] initWithCString:nomeAluno encoding:NSUTF8StringEncoding];
      
        NSLog(myAluno.getNome);
     
        NSLog(@"Introduza o seu numero");
        
        int numeroAluno;
        scanf("%d",&numeroAluno);
        
        //myAluno.numero = numeroAluno;
        [myAluno setNumero:numeroAluno];
        
        NSLog(@"%d", myAluno.getNumero);
        
        int numeroDisciplinas;
        NSLog(@"Introduza o numero de disciplinas");
        scanf("%d",&numeroDisciplinas);
        
        
        char nomeDisciplina[20];
        int nota;
        
        //Inicializar o array disciplinas
        [myAluno inicializarDisciplinas];
        
        for (int i=0; i<numeroDisciplinas; i++)
        {
            myDisciplina  = [[Disciplinas alloc]init];
            
            NSLog(@"Introduza a disciplina");
            scanf("%s",nomeDisciplina);
            myDisciplina.nomeDisciplina = [[NSString alloc] initWithCString:nomeDisciplina encoding:NSUTF8StringEncoding];
            
            NSLog(@"Introduza a nota");
            scanf("%d",&nota);
            myDisciplina.nota=nota;
            
            //[myAluno.getDisciplina setValue:myDisciplina forKey:myDisciplina.getNomeDisciplina];
            //[myAluno setDisciplina: myDisciplina];
            
//            [xpto addObject:myDisciplina];
            
            [myAluno setDisciplina:myDisciplina];
        }
        
        //int nPosicoes = [xpto count];
        
//        float media=0.0;
//        
//        for (int i = 0; i < [xpto count]; i++)
//        {
//            media += [[xpto objectAtIndex:i] getNota];
//        }
//        
//        media = media/[xpto count];
//        
//        NSLog(@"%f",media);
        
        //NSLog(@"%d",nPosicoes);
        
        //myDisciplina = [xpto objectAtIndex:1];
        //NSLog(myDisciplina.getNomeDisciplina);
        
        NSLog(@"%d",[myAluno countDisciplinas]);
        
        NSLog(@"%.2f",[myAluno mediaNotas]);
    }
    return 0;
}

