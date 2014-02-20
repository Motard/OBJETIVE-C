//
//  Disciplinas.h
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disciplina : NSObject <NSCoding>

@property (nonatomic) NSString * siglaDisciplina;
@property (nonatomic) NSString * nomeDisciplina;
@property (nonatomic) NSString * siglaCurso;
@property (nonatomic) int qtdModulos;

@end
