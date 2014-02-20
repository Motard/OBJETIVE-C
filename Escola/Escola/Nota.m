//
//  Nota.m
//  Escola
//
//  Created by Formando FLAG on 12/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Nota.h"

@implementation Nota

#define encodeKeyIntNumeroAluno         @"encodeKeyIntNumeroAluno"
#define encodeKeyStringSiglaDisciplina  @"encodeKeyStringSiglaDisciplina"
#define encodeKeyIntNumeroModulo        @"encodeKeyIntNumeroModulo"
#define encodeKeyIntNota                @"encodeKeyIntNota"
#define encodeKeyBoolNovaNota           @"encodeKeyBoolNovaNota"

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super init])
    {
        self.numeroAluno        =[aDecoder decodeIntForKey:encodeKeyIntNumeroAluno];
        self.siglaDisciplina    =[aDecoder decodeObjectForKey:encodeKeyStringSiglaDisciplina];
        self.numeroModulo       =[aDecoder decodeIntForKey:encodeKeyIntNumeroModulo];
        self.nota               =[aDecoder decodeIntForKey:encodeKeyIntNota];
        self.novaNota           =[aDecoder decodeBoolForKey:encodeKeyBoolNovaNota];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.numeroAluno forKey:encodeKeyIntNumeroAluno];
    [aCoder encodeObject:self.siglaDisciplina forKey:encodeKeyStringSiglaDisciplina];
    [aCoder encodeInteger:self.numeroModulo forKey:encodeKeyIntNumeroModulo];
    [aCoder encodeInteger:self.nota forKey:encodeKeyIntNota];
    [aCoder encodeBool:self.novaNota forKey:encodeKeyBoolNovaNota];
}

@end
