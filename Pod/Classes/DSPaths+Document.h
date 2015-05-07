//
//  DSPaths+Document.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (Document)

/** Get the full path to the Documents Directory.
 @return Full path to the NSDocumentDirectory.
 @retval nil if not available
 */
+(NSString *)documentDirectory;

/** Get the full path to a file within the Documents Directory.
 @param filename name to add to Documents Directory
 @return Full path to file in NSDocumentDirectory
 @retval nil if not NSDocumentDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)documentWithFile:(NSString *)filename;

/** Append path components to the Documents Directory.
 @param pathComponents path componoents to append
 @return full path to components in NSDocumentDirectory
 @retval nil if NSDocumentsDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)documentWithPathComponents:(NSArray *)pathComponents;

@end
