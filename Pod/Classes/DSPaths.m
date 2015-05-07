//
//  DSAppPaths.m
//  Music Stitcher
//
//  Created by Danny Sung on 09/05/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import "DSPaths.h"

@implementation DSPaths

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES);
    NSString *resolvedPath;
    if( paths.count > 0 ) {
        resolvedPath = paths[0];
    }
    return resolvedPath;
}

+ (NSString *)pathWithFile:(NSString *)filename inSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory {
    NSString *path = [self pathWithSearchPathDirectory:searchPathDirectory];
    if( !path )
        return nil;
    if( !filename )
        return nil;
    
    return [NSString pathWithComponents:@[path, filename]];
}

+ (NSString *)pathWithComponents:(NSArray *)pathComponents inSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory {
    NSString *rtn;
    NSString *path = [self pathWithSearchPathDirectory:searchPathDirectory];
    if( !path )
        return nil;
    if( !pathComponents )
        return nil;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1+pathComponents.count];
    [array addObject:path];
    [array addObjectsFromArray:pathComponents];
    
    rtn = [NSString pathWithComponents:array];
    
    return rtn;

}


+ (void)createDirectory:(NSString *)directory error:(NSError **)errorOut {
    if( !directory )
        return;
    [[NSFileManager defaultManager] createDirectoryAtPath:directory
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:errorOut];
}

@end
