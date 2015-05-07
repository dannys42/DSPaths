//
//  DSPaths+Caches.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (Cache)

/** Get the full path to the Cache Directory.
 @return Full path to the NSCachesDirectory.
 @retval nil if not available
 */
+(NSString *)cacheDirectory;

/** Get the full path to a file within the Cache Directory.
 @param filename name to add to Cache Directory
 @return Full path to file in NSCachesDirectory
 @retval nil if not NSCachesDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)cacheWithFile:(NSString *)filename;

/** Append path components to the Cache Directory.
 @param pathComponents path components to append
 @return full path to components in NSCachesDirectory
 @retval nil if NSCachesDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)cacheWithPathComponents:(NSArray *)pathComponents;

/** Get the full path to the Temp Directory and create it if necessary.
 @param shouldCreate Specify \em TRUE to create the path and intermediate paths if necessary.
 @param errorOut On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
 @see tempDirectory
 @return full path to Temp Directory
 */
+ (NSString *)cacheDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut;

@end
