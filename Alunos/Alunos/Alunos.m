//
//  Alunos.m
//  Alunos
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Alunos.h"

@implementation Alunos


-(int) getNumero
{
    return numero;
}

-(void) setNumero:(int)novoNumero
{
    numero = novoNumero;
}

-(NSString *) getNome
{
    return nome;
}

-(void)setNome:(NSString *)novoNome
{
    nome = novoNome;
}

-(void) inicializarDisciplinas
{
    disciplinas = [[NSMutableArray alloc]init];
}

-(NSArray *) getDisciplina
{
    return disciplinas;
}

-(void)setDisciplina:(Disciplinas *)novaDisciplina
{
    //[disciplinas setValue:novaDisciplina forKey:novaDisciplina.getNomeDisciplina];
    [disciplinas addObject:novaDisciplina];
    
    for (int i = 0; i<[disciplinas count]; i++)
    {
        NSLog([[disciplinas objectAtIndex:i] getNomeDisciplina]);
        NSLog(@"%d",[[disciplinas objectAtIndex:i] getNota]);
    }
    
}

-(int) countDisciplinas
{
    int n;
    n = [disciplinas count];
    return n;
}

-(float) mediaNotas
{
    float media = 0.0;
    
    for (int i = 0; i<[disciplinas count]; i++)
    {
        media += [[disciplinas objectAtIndex:i] getNota];
        
        NSLog([[disciplinas objectAtIndex:i] getNomeDisciplina]);
        NSLog(@"%d",[[disciplinas objectAtIndex:i] getNota]);
    }
    
    media = media/[disciplinas count];
    
    return media;
}

@end
