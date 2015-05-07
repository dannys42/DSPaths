//
//  DSPaths+Library.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (Library)

/** Get the full path to the Library Directory.
 @return Full path to the NSLibraryDirectory.
 @retval nil if not available
 */
+(NSString *)libraryDirectory;

/** Get the full path to a file within the Library Directory.
 @param filename name to add to Library Directory
 @return Full path to file in NSLibraryDirectory
 @retval nil if not NSLibraryDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)libraryWithFile:(NSString *)filename;

/** Append path components to the Library Directory.
 @param pathComponents path componoents to append
 @return full path to components in NSLibraryDirectory
 @retval nil if NSLibraryDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)libraryWithPathComponents:(NSArray *)pathComponents;


@end
