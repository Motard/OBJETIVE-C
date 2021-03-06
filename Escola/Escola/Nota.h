//
//  Nota.h
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Nota : NSObject <NSCoding>

@property (nonatomic) int numeroAluno;
@property (nonatomic) NSString * siglaDisciplina;
@property (nonatomic) int numeroModulo;
@property (nonatomic) int nota;
@property (nonatomic) BOOL novaNota;

@end
