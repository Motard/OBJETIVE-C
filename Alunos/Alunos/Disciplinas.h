//
//  Disciplinas.h
//  Alunos
//
//  Created by Formando FLAG on 07/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disciplinas : NSObject
{
    int nota;
    NSString * nomeDisciplina;
}

-(int)getNota;
-(void) setNota:(int)novaNota;
-(NSString *) getNomeDisciplina;
-(void) setNomeDisciplina:(NSString *) novaDisciplina;

@end
