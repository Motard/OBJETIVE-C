//
//  Utilizador.m
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Utilizador.h"

@implementation Utilizador

#define encodeKeyIntNumeroUtilizador    @"encodeKeyIntNumeroUtilizador"
#define encodeKeyStringNomeUtilizador   @"encodeKeyStringNomeUtilizador"
#define encodeKeyIntTipoUtilizador      @"encodeKeyIntTipoUtilizador"
#define encodeKeyStringPassword         @"encodeKeyStringPassword"
#define encodeKeyStringSiglacurso       @"encodeKeyStringSiglacurso"

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.numeroUtilizador   = [aDecoder decodeIntForKey:encodeKeyIntNumeroUtilizador];
        self.nomeUtilizador     = [aDecoder decodeObjectForKey:encodeKeyStringNomeUtilizador];
        self.tipoUtilizador     = [aDecoder decodeIntForKey:encodeKeyIntTipoUtilizador];
        self.password           = [aDecoder decodeObjectForKey:encodeKeyStringPassword];
        self.siglaCurso         = [aDecoder decodeObjectForKey:encodeKeyStringSiglacurso];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.numeroUtilizador forKey:encodeKeyIntNumeroUtilizador];
    [aCoder encodeObject:self.nomeUtilizador forKey:encodeKeyStringNomeUtilizador];
    [aCoder encodeInteger:self.tipoUtilizador forKey:encodeKeyIntTipoUtilizador];
    [aCoder encodeObject:self.password forKey:encodeKeyStringPassword];
    [aCoder encodeObject:self.siglaCurso forKey:encodeKeyStringSiglacurso];
}

@end
