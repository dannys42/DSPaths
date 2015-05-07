//
//  NSURL+DSPaths.h
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//

#import <Foundation/Foundation.h>

@interface NSURL (DSPaths)

+ (NSURL *)cacheDirectory;
+ (NSURL *)cacheDirectoryWithPath:(NSString *)path;
+ (NSURL *)cacheDirectoryWithPathComponents:(NSArray *)pathComponents;

+ (NSURL *)documentDirectory;
+ (NSURL *)documentDirectoryWithPath:(NSString *)path;
+ (NSURL *)documentDirectoryWithPathComponents:(NSArray *)pathComponents;

+ (NSURL *)libraryDirectory;
+ (NSURL *)libraryDirectoryWithPath:(NSString *)path;
+ (NSURL *)libraryDirectoryWithPathComponents:(NSArray *)pathComponents;

+ (NSURL *)supportDirectory;
+ (NSURL *)supportDirectoryWithPath:(NSString *)path;
+ (NSURL *)supportDirectoryWithPathComponents:(NSArray *)pathComponents;

+ (NSURL *)tempDirectory;
+ (NSURL *)tempDirectoryWithPath:(NSString *)path;
+ (NSURL *)tempDirectoryWithPathComponents:(NSArray *)pathComponents;

+ (NSURL *)userDirectory;
+ (NSURL *)userDirectoryWithPath:(NSString *)path;
+ (NSURL *)userDirectoryWithPathComponents:(NSArray *)pathComponents;

@end

#import "NSURL+DSAppTemplate.h"
