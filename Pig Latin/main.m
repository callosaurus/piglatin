//
//  main.m
//  Pig Latin
//
//  Created by Callum Davies on 2017-02-10.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSString *testString = @"quietly ambitious sentence with quintessentially difficult words from many use cases";
        NSLog(@"%@",[testString stringByPigLatinization]);
        
    }
    return 0;
}
