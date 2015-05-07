//
//  DSPaths+Temp.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+Temp.h"

@implementation DSPaths (Temp)

+ (NSString*)tempDirectory {
    return NSTemporaryDirectory();
}

+(NSString*)tempWithPathComponents:(NSArray *)pathComponents {
    NSString *rtn;

    if( !pathComponents )
        return nil;
    NSString *path = [self tempDirectory];
    if( !path )
        return nil;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1+pathComponents.count];
    [array addObject:path];
    [array addObjectsFromArray:pathComponents];
    
    rtn = [NSString pathWithComponents:array];
    
    return rtn;
}

+ (NSString*)tempWithFile:(NSString *)filename {
    return [self tempWithPathComponents:@[filename]];
}

+ (NSString *)tempDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut {
    NSString *path = [self tempDirectory];
    if( !path )
        return nil;
    
    if( shouldCreate ) {
        [self createDirectory:path error:errorOut];
    }
    
    return path;
}

@end
