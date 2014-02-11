//
//  Alunos.h
//  Alunos
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Disciplinas.h"

@interface Alunos : NSObject

{
    int numero;
    NSString * nome;
    //NSArray * disciplinas;
    NSMutableArray * disciplinas;
}


-(int) getNumero;
-(void) setNumero:(int)novoNumero;
-(NSString *) getNome;
-(void)setNome:(NSString *)novoNome;
-(void) inicializarDisciplinas;
-(NSArray *) getDisciplina;
-(void)setDisciplina:(Disciplinas *)novaDisciplina;

-(int) countDisciplinas;
-(float) mediaNotas;

@end
