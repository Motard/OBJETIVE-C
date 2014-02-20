//
//  Disciplinas.m
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Disciplina.h"

@implementation Disciplina

#define encodeKeyStringSiglaDisciplina  @"encodeKeyStringSiglaDisciplina"
#define encodeKeyStringNomeDisciplina   @"encodeKeyStringNomeDisciplina"
#define encodeKeyStringSiglaCurso       @"encodeKeyStringSiglaCurso"
#define encodeKeyIntQtdModulos          @"encodeKeyIntQtdModulos"

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super init])
    {
        self.siglaDisciplina    = [aDecoder decodeObjectForKey:encodeKeyStringSiglaDisciplina];
        self.nomeDisciplina     = [aDecoder decodeObjectForKey:encodeKeyStringNomeDisciplina];
        self.siglaCurso         = [aDecoder decodeObjectForKey:encodeKeyStringSiglaCurso];
        self.qtdModulos         = [aDecoder decodeIntForKey:encodeKeyIntQtdModulos];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.siglaDisciplina forKey:encodeKeyStringSiglaDisciplina];
    [aCoder encodeObject:self.nomeDisciplina forKey:encodeKeyStringNomeDisciplina];
    [aCoder encodeObject:self.siglaCurso forKey:encodeKeyStringSiglaCurso];
    [aCoder encodeInteger:self.qtdModulos forKey:encodeKeyIntQtdModulos];
}

@end
