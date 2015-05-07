//
//  DSAppPaths.h
//
//  Created by Danny Sung on 09/05/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DSPaths : NSObject

/** Get a valid path for a given searchPath.
 A convenience method that gets the first path from a call to:
 
 @code
    NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES);
 @endcode
 @param searchPathDirectory
 @return filesystem path
 @retval nil if not found
 */
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;

/** Get the full path to a file within the search Path Directory.
 @param filename name to add to Documents Directory
 @return full path to file in the given search path
 @retval nil if searchPathDirectory could not be determined.
 @retval nil if filename is nil
 @see pathWithSearchPathDirectory:
 */
+ (NSString *)pathWithFile:(NSString *)filename inSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;

/** Append path components to a search Path Directory.
 @param pathComponents path components to append
 @return full path to file in the given search path
 @retval nil if searchPathDirectory could not be determined.
 @retval nil if filename is nil
 @see pathWithSearchPathDirectory:
 */
+ (NSString *)pathWithComponents:(NSArray *)pathComponents inSearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;


/** Create a path and all intermediate paths.
 @param directory full path to create
 @param errorOut On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
 */
+ (void)createDirectory:(NSString *)directory error:(NSError **)errorOut;

@end

#import "DSPaths+Cache.h"
#import "DSPaths+CustomarySupport.h"
#import "DSPaths+Document.h"
#import "DSPaths+Library.h"
#import "DSPaths+Support.h"
#import "DSPaths+Temp.h"
