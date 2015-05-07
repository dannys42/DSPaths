//
//  NSURL+AppTemplate.m
//  Music Stitcher
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import "NSURL+AppTemplate.h"
#import "DSLog.h"
#import "DSAppPaths.h"

#define kAPPLICATION_SUPPORT_DIRECTORY          @"_ApplicationSupportDirectory"
#define kLIBRARY_DIRECTORY                      @"_LibraryDirectory"
#define kUSER_DIRECTORY                         @"_UserDirectory"
#define kDOCUMENTATION_DIRECTORY                @"_DocumentationDirectory"
#define kDOCUMENT_DIRECTORY                     @"_DocumentDirectory"
#define kCACHES_DIRECTORY                       @"_CachesDirectory"

@implementation NSURL (AppTemplate)

- (NSString *)templateKey {
    if( !self.isTemplate )
        return nil;
    
    NSArray *pathComponents = [self pathComponents];
    
    if( pathComponents.count > 1 ) {
        return pathComponents[1];
    }
    return nil;
}

- (BOOL)isTemplate {
    NSArray *pathComponents = [self pathComponents];
    
    if( pathComponents.count > 1 ) {
        if( [NSURL searchPathFromKey:pathComponents[1]] > 0 )
            return YES;
    }
    
    return NO;
}

- (NSArray *)relativePathComponents {
    NSMutableArray *pathComponents = self.pathComponents.mutableCopy;
    if( pathComponents.count > 2 ) {
        [pathComponents removeObjectAtIndex:0]; /* 1st slash */
        if( [NSURL searchPathFromKey:pathComponents[0]] > 0 ) {
            [pathComponents removeObjectAtIndex:0];
        } else {
            pathComponents = nil;
        }
    }
    return pathComponents;
}

+ (instancetype)templatePath:(NSString *)path fromRoot:(NSSearchPathDirectory)searchPath {
    NSString *templatePath = [[self stringFromSearchPath:searchPath] stringByAppendingPathComponent:path];
    
    if( templatePath == nil )
        return nil;
    
    NSURL *dsurl = [[NSURL alloc] initFileURLWithPath:templatePath];
    
    return dsurl;
}

/** Create a DSURL that expands template */
- (instancetype)expandedURL {
    NSURL *url;
#if TARGET_IPHONE_SIMULATOR
    NSSearchPathDirectory searchPath = [NSURL searchPathFromKey:self.templateKey];
    if( searchPath > 0 ) {
        NSString *path;
        
        path = [NSURL expandSearchPath:searchPath];
        NSString *relativePath = [NSString pathWithComponents:self.relativePathComponents];
        
        path = [path stringByAppendingPathComponent:relativePath];
        url = [[NSURL alloc] initFileURLWithPath:path];
    } else if( self.path != nil ) {
        url = [[NSURL alloc] initFileURLWithPath:self.path];
    }
#else
    url = self;
#endif
    return url;
}

+ (instancetype)contractURL:(NSString *)urlString {
    NSLog(@"TODO\n");
    return nil;
}



#pragma mark Private Methods

+ (NSString *)stringFromSearchPath:(NSSearchPathDirectory)searchPath {
    NSString *s;
    switch( searchPath ) {
        case NSApplicationSupportDirectory: s = kAPPLICATION_SUPPORT_DIRECTORY; break;
        case NSLibraryDirectory:            s = kLIBRARY_DIRECTORY; break;
        case NSUserDirectory:               s = kUSER_DIRECTORY; break;
        case NSDocumentationDirectory:      s = kDOCUMENTATION_DIRECTORY; break;
        case NSDocumentDirectory:           s = kDOCUMENT_DIRECTORY; break;
        case NSCachesDirectory:             s = kCACHES_DIRECTORY; break;
        default:
            ELog(@"Unhandled search path: %lu\n", (long)searchPath);
            break;
    }
    return s;
}

+ (NSSearchPathDirectory)searchPathFromKey:(NSString *)string {
    NSSearchPathDirectory searchPath = 0;
    if( [string isEqualToString:kAPPLICATION_SUPPORT_DIRECTORY] ) {
        searchPath = NSApplicationSupportDirectory;
    } else if( [string isEqualToString:kLIBRARY_DIRECTORY] ) {
        searchPath = NSLibraryDirectory;
    } else if( [string isEqualToString:kUSER_DIRECTORY] ) {
        searchPath = NSUserDirectory;
    } else if( [string isEqualToString:kDOCUMENTATION_DIRECTORY] ) {
        searchPath = NSDocumentationDirectory;
    } else if( [string isEqualToString:kDOCUMENT_DIRECTORY] ) {
        searchPath = NSDocumentDirectory;
    } else if( [string isEqualToString:kCACHES_DIRECTORY] ) {
        searchPath = NSCachesDirectory;
    }
    return searchPath;
}

/** Convert searchPath to a string containing the absolute file path */
+ (NSString *)expandSearchPath:(NSSearchPathDirectory)searchPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(
                                                         searchPath,
                                                         NSUserDomainMask,
                                                         YES);
    if( paths.count > 0 ) {
        return paths[0];
    }
    return nil;
}

@end
