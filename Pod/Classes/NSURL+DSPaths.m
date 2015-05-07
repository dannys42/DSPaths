//
//  NSURL+DSPaths.m
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//

#import "NSURL+DSPaths.h"
#import "DSPaths.h"

@implementation NSURL (DSPaths)

+ (NSURL *)cacheDirectory {
    return [NSURL fileURLWithPath:[DSPaths cacheDirectory]];
}

+ (NSURL *)cacheDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths cacheWithFile:path]];
}

+ (NSURL *)cacheDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths cacheWithPathComponents:pathComponents]];
}

+ (NSURL *)documentDirectory {
    return [NSURL fileURLWithPath:[DSPaths documentDirectory]];
}

+ (NSURL *)documentDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths documentWithFile:path]];
}

+ (NSURL *)documentDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths documentWithPathComponents:pathComponents]];
}

+ (NSURL *)libraryDirectory {
    return [NSURL fileURLWithPath:[DSPaths libraryDirectory]];
}

+ (NSURL *)libraryDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths libraryWithFile:path]];
}

+ (NSURL *)libraryDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths libraryWithPathComponents:pathComponents]];
}

+ (NSURL *)supportDirectory {
    return [NSURL fileURLWithPath:[DSPaths supportDirectory]];
}

+ (NSURL *)supportDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths libraryWithFile:path]];
}

+ (NSURL *)supportDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths supportWithPathComponents:pathComponents]];
}

+ (NSURL *)tempDirectory {
    return [NSURL fileURLWithPath:[DSPaths tempDirectory]];
}

+ (NSURL *)tempDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths libraryWithFile:path]];
}

+ (NSURL *)tempDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths tempWithPathComponents:pathComponents]];
}

+ (NSURL *)userDirectory {
    return [NSURL fileURLWithPath:[DSPaths userDirectory]];
}

+ (NSURL *)userDirectoryWithPath:(NSString *)path {
    return [NSURL fileURLWithPath:[DSPaths tempWithFile:path]];
}

+ (NSURL *)userDirectoryWithPathComponents:(NSArray *)pathComponents {
    return [NSURL fileURLWithPath:[DSPaths userWithPathComponents:pathComponents]];
}

@end
