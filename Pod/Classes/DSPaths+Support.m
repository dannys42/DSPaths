//
//  DSPaths+ApplicationSupport.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+Support.h"

@implementation DSPaths (Support)

+ (NSString*)supportDirectory {
    return [self pathWithSearchPathDirectory:NSApplicationSupportDirectory];
}

+ (NSString*)supportWithFile:(NSString *)filename {
    return [self pathWithFile:filename inSearchPathDirectory:NSApplicationSupportDirectory];
}

+(NSString*)supportWithPathComponents:(NSArray *)pathComponents {
    return [self pathWithComponents:pathComponents inSearchPathDirectory:NSApplicationSupportDirectory];
}

+ (NSString *)supportDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut {
    NSString *path = [self pathWithSearchPathDirectory:NSApplicationSupportDirectory];
    if( !path )
        return nil;
    
    if( shouldCreate ) {
        [self createDirectory:path error:errorOut];
    }
    
    return path;
}

@end
