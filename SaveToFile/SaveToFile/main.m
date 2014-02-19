//
//  main.m
//  SaveToFile
//
//  Created by Paulo Martins on 19/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mota.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Mota * motaObj = [[Mota alloc]init];
        NSMutableArray * motaArr = [[NSMutableArray alloc]init];
        NSMutableDictionary * motaDic = [[NSMutableDictionary alloc]init];
        int escolha;
        
        
//      Bloco para defenir o path e o nome do ficheiro - Neste caso o path é a directoria Documents
        NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentsDir = [path objectAtIndex:0];
        NSString * fileName = [documentsDir stringByAppendingPathComponent:@"file.txt"];

        
        NSLog(@"Esolha 1-array  2-dicitionary");
        scanf("%d",&escolha);
        
        switch (escolha)
        {
            case 1:
            {
                
                
        //      Ver se existe o ficheiro
                if ([[NSFileManager defaultManager] fileExistsAtPath:fileName])
                {
                    NSLog(@"A ler do ficheiro\n");
                    
                    //      Ler o ficheiro para um NSMutableArray
                    NSMutableArray * novoArr = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
                    
                    int contador = [novoArr count];
                    
                    for (int i= 0; i<contador; i++)
                    {
                        Mota * novoObj = novoArr[i];
                        printf("%s",[novoObj.marca cStringUsingEncoding:NSUTF8StringEncoding]);
                        
                    }
                
                }
                else
                {
                    
                    NSLog(@"A escrever no ficheiro\n");
                    
                    motaObj.marca = @"Honda";
                    motaObj.modelo = @"XRV 750";
                    
                    
                    
                    //        [NSKeyedArchiver archiveRootObject:motaObj toFile:fileName];
                    //
                    //        Mota * novoObj = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
                    //        printf("Load \n %s \n",[[novoObj description] cStringUsingEncoding:NSUTF8StringEncoding]);
                    //        printf("%s",[novoObj.marca cStringUsingEncoding:NSUTF8StringEncoding]);
                    
                    [motaArr addObject:motaObj];
                    
                    motaObj = [[Mota alloc]init];
                    
                    motaObj.marca = @"Yamaha";
                    motaObj.modelo = @"Super Tenere";
                    
                    [motaArr addObject:motaObj];
                    
                    //      Escreve o NSMutableArray para o ficheiro
                    [NSKeyedArchiver archiveRootObject:motaArr toFile:fileName];
                }
                    
                break;
            }
            case 2:
            {
                motaObj.marca = @"Suzuki";
                motaObj.modelo = @"DR 350S";
                [motaDic setValue:motaObj forKey:motaObj.marca];
                
                [NSKeyedArchiver archiveRootObject:motaDic toFile:fileName];
                
                NSMutableDictionary * novoDic = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
                
                for (NSString * chave in novoDic)
                {
                    Mota * novaMota = [novoDic objectForKey:chave];
                    printf("%s",[novaMota.marca cStringUsingEncoding:NSUTF8StringEncoding]);
                }
                
                break;
            }
        
        }
    }
    return 0;
}

