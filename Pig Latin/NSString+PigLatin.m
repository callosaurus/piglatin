//
//  NSString+PigLatin.m
//  Pig Latin
//
//  Created by Callum Davies on 2017-02-10.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization
{
    //Grab words to be latinized
    NSArray *sentenceToBeLatinized = [self componentsSeparatedByString:@" "];
    
    //Declare vowel discriminators
    NSString *vowelString = @"aeiouy";
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:vowelString];
    
    
    //Initialize empty array of words that will be added to in loop once converted
    NSMutableArray *latinizedWords = [NSMutableArray new];
    
    
    
    
    for (NSString *word in sentenceToBeLatinized) {
        
        //CASE WHERE PREFIX IS "qu-", e.g. quiet, queer, quintessence
        if ([word hasPrefix:@"qu"]) {
            
            NSString *cutWord = [word substringFromIndex:2];
            
            //convert
            NSString *newWord = [cutWord stringByAppendingString:@"quay"];
            
            //add to completed words array
            [latinizedWords addObject:newWord];
            
        } else {
            //split words where first vowel is found
            NSArray *wordInChunks = [word componentsSeparatedByCharactersInSet:vowels];
            NSString *firstWordChunk = [wordInChunks objectAtIndex:0];
            NSString *newPrefix = [word substringFromIndex:[firstWordChunk length]];
            
            //CASE WHERE WORD BEGINS WITH VOWEL - e.g. omelet, aardvark,
            if ([firstWordChunk isEqualToString:@""]) {
                
                //convert
                NSString *latinizedVowelWord = [word stringByAppendingString:@"way"];
                
                //add to completed words array
                [latinizedWords addObject:latinizedVowelWord];
            
            //ALL OTHER WORD CASES
            } else {
                
                //convert
                NSArray *wordComponents = @[newPrefix, firstWordChunk, @"ay"];
                
                //add to completed words array
                [latinizedWords addObject:[wordComponents componentsJoinedByString:@""]];
                
            }
        }
    }
    
    //Join array of latinized words together
    NSString *latinizedSentence = [latinizedWords componentsJoinedByString:@" "];
    
    //return completed sentence
    return latinizedSentence;
    
}

@end
