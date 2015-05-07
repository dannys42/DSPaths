//
//  DSPaths+Caches.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+Cache.h"

@implementation DSPaths (Cache)

+ (NSString*)cacheDirectory {
    return [self pathWithSearchPathDirectory:NSCachesDirectory];
}

+ (NSString*)cacheWithFile:(NSString *)filename {
    return [self pathWithFile:filename inSearchPathDirectory:NSCachesDirectory];
}

+(NSString*)cacheWithPathComponents:(NSArray *)pathComponents {
    return [self pathWithComponents:pathComponents inSearchPathDirectory:NSCachesDirectory];
}

+ (NSString *)cacheDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut {
    NSString *path = [self pathWithSearchPathDirectory:NSCachesDirectory];
    if( !path )
        return nil;
    
    if( shouldCreate ) {
        [self createDirectory:path error:errorOut];
    }
    
    return path;
}

@end
