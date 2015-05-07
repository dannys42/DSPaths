//
//  DSPaths+ApplicationSupport.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (Support)

/** Get the full path to the Application Support Directory.
 @return Full path to the NSApplicationSupportDirectory.
 @retval nil if not available
 */
+(NSString *)supportDirectory;

/** Get the full path to a file within the Application Support Directory.
 @param filename name to add to Application Support Directory
 @return Full path to file in NSApplicationSupportDirectory
 @retval nil if not NSApplicationSupportDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)supportWithFile:(NSString *)filename;

/** Append path components to the Application Support Directory.
 @param pathComponents path components to append
 @return full path to components in NSApplicationSupportDirectory
 @retval nil if NSApplicationSupportDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)supportWithPathComponents:(NSArray *)pathComponents;

/** Get the full path to the Application Support Directory and create it if necessary.
 @param shouldCreate Specify \em TRUE to create the path and intermediate paths if necessary.
 @param errorOut On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
 @see supportDirectory
 @return full path to NSApplicationSupportDirectory
 */
+ (NSString *)supportDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut;

@end
