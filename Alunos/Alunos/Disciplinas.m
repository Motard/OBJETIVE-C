//
//  Disciplinas.m
//  Alunos
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Disciplinas.h"

@implementation Disciplinas

-(int)getNota
{
    return nota;
}

-(void) setNota:(int)novaNota
{
    nota = novaNota;
}

-(NSString *) getNomeDisciplina
{
    return nomeDisciplina;
}

-(void) setNomeDisciplina:(NSString *) novaDisciplina
{
    nomeDisciplina = novaDisciplina;
}

@end
