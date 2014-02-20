//
//  Utilizador.h
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilizador : NSObject <NSCoding>

@property (nonatomic) int numeroUtilizador;
@property (nonatomic) NSString * nomeUtilizador;
@property (nonatomic) int tipoUtilizador;
@property (nonatomic) NSString * password;
@property (nonatomic) NSString * siglaCurso;

@end
