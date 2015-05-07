//
//  NSURL+AppTemplate.m
//  Music Stitcher
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import "NSURL+DSAppTemplate.h"
#import "DSPaths.h"

#define kSUPPORT_DIRECTORY              @"_ApplicationSupportDirectory"
#define kCUSTOMARY_SUPPORT_DIRECTORY    @"_CustomaryApplicationSupportDirectory"
#define kLIBRARY_DIRECTORY              @"_LibraryDirectory"
#define kDOCUMENT_DIRECTORY             @"_DocumentDirectory"
#define kCACHE_DIRECTORY                @"_CacheDirectory"
#define kTEMP_DIRECTORY                 @"_TempDirectory"
#define kUSER_DIRECTORY                 @"_UserDirectory"
/* Not yet supported
 #define kDOCUMENTATION_DIRECTORY        @"_DocumentationDirectory"
 */


@implementation NSURL (DSAppTemplate)

- (NSString *)templateKey {
    NSArray *pathComponents = [self pathComponents];
    if( pathComponents.count <= 1 )
        return nil;
    
    NSDictionary *templateMap = [NSURL templateMap];
    NSString *p1 = pathComponents[1];
    NSString *templateKey = templateMap[p1];

    return templateKey;
}

- (BOOL)isTemplated {
    if( [self templateKey] )
        return YES;
    return NO;
}

#if 0
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

/** Create a NSURL that expands template */
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
#endif


#pragma mark Class Methods

+ (instancetype)expandWithURL:(NSURL *)url {
    if( !url.isFileURL )
        return url.copy;
    
    NSArray *pathComponents = url.pathComponents;
    NSDictionary *templateMap = [NSURL templateMap];
    
    NSMutableArray *newPathComponents = [[NSMutableArray alloc] initWithCapacity:pathComponents.count];

    NSInteger idx;
    for(idx=0; idx<2; idx++) {
        NSString *component = pathComponents[idx];
        NSString *mappedPath = templateMap[component];
        if( mappedPath ) {
            [newPathComponents addObjectsFromArray:mappedPath.pathComponents];
            idx++;
            break;
        } else {
            [newPathComponents addObject:component];
        }
    }
    
    for(; idx<pathComponents.count; idx++) {
        NSString *component = pathComponents[idx];
        [newPathComponents addObject:component];
    }
    
    NSURL *rtn = [NSURL fileURLWithPathComponents:newPathComponents];
    return rtn;
}

+ (instancetype)contractWithURL:(NSURL *)url {
    if( !url.isFileURL )
        return url.copy;
    NSString *urlString = url.path;
    NSString *matchKey;
    NSUInteger matchScore = 0;
    
    NSDictionary *templateMap = [NSURL templateMap];
    for(NSString *templateKey in templateMap) {
        NSString *templatePath = templateMap[templateKey];
        
        if( [urlString hasPrefix:templatePath] ) {
            NSUInteger score = templatePath.length;
            if( score > matchScore ) {
                matchScore = score;
                matchKey = templateKey;
            }
        }
    }
    
    if( !matchKey )
        return url.copy;
    
    NSString *templatePath = templateMap[matchKey];
    NSURL *rtn;
    if( templatePath.length == urlString.length ) {
        rtn = [NSURL fileURLWithPath:matchKey];
    } else {
        NSString *relativeUrlPath = [urlString substringFromIndex:templatePath.length+1];
        NSString *contractPath = [NSString stringWithFormat:@"%@/%@", matchKey, relativeUrlPath];
        rtn = [NSURL fileURLWithPath:contractPath];
    }
    
    return rtn;
}


#pragma mark Private Methods

+ (NSDictionary *)templateMap {
    static dispatch_once_t once;
    static NSDictionary *templateMap;
    dispatch_once(&once, ^{
        templateMap = @{
                        kLIBRARY_DIRECTORY : [DSPaths libraryDirectory],
                        kDOCUMENT_DIRECTORY : [DSPaths documentDirectory],
                        kSUPPORT_DIRECTORY : [DSPaths supportDirectory],
                        kCUSTOMARY_SUPPORT_DIRECTORY : [DSPaths customarySupportDirectory],
                        kCACHE_DIRECTORY : [DSPaths cacheDirectory],
                        kTEMP_DIRECTORY : [DSPaths tempDirectory],
                        kUSER_DIRECTORY : [DSPaths userDirectory],
                        };
    });
    return templateMap;
}

@end
