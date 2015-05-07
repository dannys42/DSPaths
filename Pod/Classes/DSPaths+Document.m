//
//  DSPaths+Document.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+Document.h"

@implementation DSPaths (Document)

+ (NSString*)documentDirectory {
    return [self pathWithSearchPathDirectory:NSDocumentDirectory];
}

+ (NSString*)documentWithFile:(NSString *)filename {
    return [self pathWithFile:filename inSearchPathDirectory:NSDocumentDirectory];
}

+(NSString*)documentWithPathComponents:(NSArray *)pathComponents {
    return [self pathWithComponents:pathComponents inSearchPathDirectory:NSDocumentDirectory];
}

@end
