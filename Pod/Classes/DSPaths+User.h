//
//  DSPaths+User.h
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (User)

/** Get the full path to the User Directory.
 @return Full path to the NSTempDirectory.
 @retval nil if not available
 */
+(NSString *)userDirectory;

/** Get the full path to a file within the User Directory.
 @param filename name to add to Temp Directory
 @return Full path to file in NSTempDirectory
 @retval nil if not NSCachesDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)userWithFile:(NSString *)filename;

/** Append path components to the User Directory.
 @param pathComponents path components to append
 @return full path to components in NSTempDirectory
 @retval nil if NSTempDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)userWithPathComponents:(NSArray *)pathComponents;

@end
