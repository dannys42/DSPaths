//
//  DSPaths+ApplicationSupport.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths+CustomarySupport.h"
#import "DSPaths+Support.h"

@implementation DSPaths (CustomarySupport)

/* In iOS, the directory returned by NSApplicationSupportDirectory is technically writable.  However, by convention, we normally expect the application name to be embeeded below it, like so:
 
 /Users/person/Library/Application Support/ExampleApp/
 
 Ref: http://www.cocoawithlove.com/2010/05/finding-or-creating-application-support.html
 */
+ (NSString *)customarySupportDirectory {
    NSString *executableName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
    NSString  *result = [self supportWithPathComponents:@[executableName]];
    return result;
}

+ (NSString *)customarySupportDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut {
    NSString *path = [self customarySupportDirectory];
    if( !path )
        return nil;
    
    if( shouldCreate ) {
        [self createDirectory:path error:errorOut];
    }
    
    return path;
}


+ (NSString*)customarySupportWithFile:(NSString *)filename {
    NSString *path = [self customarySupportDirectory];
    if( !path )
        return nil;
    if( !filename )
        return nil;
    
    return [NSString pathWithComponents:@[path, filename]];
}

+(NSString*)customarySupportWithPathComponents:(NSArray *)pathComponents {
    NSString *rtn;
    NSString *path = [self customarySupportDirectory];
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


@end
