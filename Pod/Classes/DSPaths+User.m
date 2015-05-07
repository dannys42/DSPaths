//
//  DSPaths+User.m
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//

#import "DSPaths+User.h"

@implementation DSPaths (User)

+ (NSString*)userDirectory {
    return [self pathWithSearchPathDirectory:NSUserDirectory];
}

+ (NSString*)userWithFile:(NSString *)filename {
    return [self pathWithFile:filename inSearchPathDirectory:NSUserDirectory];
}

+(NSString*)userWithPathComponents:(NSArray *)pathComponents {
    return [self pathWithComponents:pathComponents inSearchPathDirectory:NSUserDirectory];
}

@end
