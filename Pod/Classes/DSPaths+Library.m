//
//  DSPaths+Library.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+Library.h"

@implementation DSPaths (Library)

+ (NSString*)libraryDirectory {
    return [self pathWithSearchPathDirectory:NSLibraryDirectory];
}

+ (NSString*)libraryWithFile:(NSString *)filename {
    return [self pathWithFile:filename inSearchPathDirectory:NSLibraryDirectory];
}

+(NSString*)libraryWithPathComponents:(NSArray *)pathComponents {
    return [self pathWithComponents:pathComponents inSearchPathDirectory:NSLibraryDirectory];
}

@end
