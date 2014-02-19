//
//  Mota.m
//  SaveToFile
//
//  Created by Paulo Martins on 19/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import "Mota.h"

@implementation Mota

#define kEncodeKeyStringMarca       @"kEncodeKeyStringMarca"
#define kEncodeKeyStringModelo      @"kEncodeKeyStringModelo"

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.marca = [aDecoder decodeObjectForKey:kEncodeKeyStringMarca];
        self.modelo = [aDecoder decodeObjectForKey:kEncodeKeyStringModelo];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.marca forKey:kEncodeKeyStringMarca];
    [aCoder encodeObject:self.modelo forKey:kEncodeKeyStringModelo];
}

@end
