//
//  DSPaths+Temp.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (Temp)

/** Get the full path to the Temp Directory.
 @return Full path to the NSTempDirectory.
 @retval nil if not available
 */
+(NSString *)tempDirectory;

/** Get the full path to a file within the Temp Directory.
 @param filename name to add to Temp Directory
 @return Full path to file in NSTempDirectory
 @retval nil if not NSCachesDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)tempWithFile:(NSString *)filename;

/** Append path components to the Temp Directory.
 @param pathComponents path components to append
 @return full path to components in NSTempDirectory
 @retval nil if NSTempDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)tempWithPathComponents:(NSArray *)pathComponents;

/** Get the full path to the Temp Directory and create it if necessary.
 @param shouldCreate Specify \em TRUE to create the path and intermediate paths if necessary.
 @param errorOut On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
 @see tempDirectory
 @return full path to Temp Directory
 */
+ (NSString *)tempDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut;

@end
