//
//  main.m
//  DiasVividos
//
//  Created by Paulo Martins on 10/02/14.
//  Copyright (c) 2014 Paulo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate * dataActual = [[NSDate alloc]init];
        NSDateComponents * dataNascimentoComponentes = [[NSDateComponents alloc]init];
        NSDate * dataNascimento = [[NSDate alloc]init];
        int dia,mes,ano,hora,minuto;
        int anos,meses,dias,horas,minutos;
        NSMutableString * frase, * fraseAux;
        
        
        NSLog(@"%s","Este programa calcula o tempo desde o nascimento.");
        
//      Obter a data de nascimento e a hora
        NSLog(@"%s","Introduza a data nascimento - dd-mm-aaaa");
        scanf("%d-%d-%d",&dia, &mes, &ano);
        NSLog(@"%s","Introduza a hora - hh:mm");
        scanf("%d:%d",&hora,&minuto);
        
//      Transferir a data obtida para o objecto NSDateComponents
        [dataNascimentoComponentes setDay:(NSInteger)dia];
        [dataNascimentoComponentes setMonth:(NSInteger)mes];
        [dataNascimentoComponentes setYear:(NSInteger)ano];
        [dataNascimentoComponentes setHour:(NSInteger)hora];
        [dataNascimentoComponentes setMinute:(NSInteger)minuto];
        
//      Converter a NSDateFromComponents para NSDate
        dataNascimento = [[NSCalendar currentCalendar] dateFromComponents:dataNascimentoComponentes];
      
//      Criar a Flag com as constantes usadas para calcular a diferença temporal
        unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
        
//      Defenir o calendário a usar
        NSCalendar * gregorian = [NSCalendar currentCalendar];
        
//      Calcular a diferença entre datas sobre o calendario defenido e as Flags
        NSDateComponents * comps = [gregorian components:unitFlags fromDate:dataNascimento toDate:dataActual options:0];
        
//      Passar cada um dos componentes para a variavel respectiva
        anos = (int)[comps year];
        meses = (int)[comps month];
        dias = (int)[comps day];
        horas = (int)[comps hour];
        minutos = (int)[comps minute];
        
        
//      Criar a String... UFA!!!
        frase =[NSMutableString stringWithFormat:@"Voce ja viveu "];
        
        if(anos)
        {
            switch (anos)
            {
                case 1:
                    fraseAux = [NSMutableString stringWithFormat:@"%d ano, ",anos];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
                    
                default:
                    fraseAux = [NSMutableString stringWithFormat:@"%d anos, ",anos];
                    frase = [frase stringByAppendingString:fraseAux];;
                    break;
            }
        }
        
        if(meses)
        {
            switch (meses)
            {
                case 1:
                    fraseAux = [NSMutableString stringWithFormat:@"%d mes, ",meses];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
                    
                default:
                    fraseAux = [NSMutableString stringWithFormat:@"%d meses, ",meses];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
            }
        }
        
        if(dias)
        {
            switch (dia)
            {
                case 1:
                    fraseAux = [NSMutableString stringWithFormat:@"%d dia, ",dias];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
                    
                default:
                    fraseAux = [NSMutableString stringWithFormat:@"%d dias, ",dias];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
            }
        }
        
        if(horas)
        {
            switch (horas)
            {
                case 1:
                    fraseAux = [NSMutableString stringWithFormat:@"%d hora ",horas];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
                    
                default:
                    fraseAux = [NSMutableString stringWithFormat:@"%d horas ",horas];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
            }
        }
        
        if(minutos)
        {
            switch (minutos)
            {
                case 1:
                    fraseAux = [NSMutableString stringWithFormat:@"e %d minuto. ",minutos];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
                    
                default:
                    fraseAux = [NSMutableString stringWithFormat:@"e %d minutos. ",minutos];
                    frase = [frase stringByAppendingString:fraseAux];
                    break;
            }
        }
        
        
        NSLog(frase);
    }
    return 0;
}

