//
//  DSPaths+ApplicationSupport.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//

#import "DSPaths.h"

@interface DSPaths (CustomarySupport)


/** Get the \em Customary Application Support directory.
 @note By convention, the \em Customary Application Support directory is the full path to the NSApplicationSupportDirectory followed by the name of the application.  For example:
 \begincode
 /Users/person/Library/Application Support/ExampleApp/
 \endcode
     The name of the application is determined by reading the CFBundleExecutable value at runtime.
 */
+(NSString *)customarySupportDirectory;


/** Get the \em Customary Application Support directory and create it if necessary.
 @note By convention, the \em Customary Application Support directory is the full path to the NSApplicationSupportDirectory followed by the name of the application.  For example:
 \begincode
 /Users/person/Library/Application Support/ExampleApp/
 \endcode
    The name of the application is determined by reading the CFBundleExecutable value at runtime.
 @param shouldCreate Specify \em TRUE to create the path and intermediate paths if necessary.
 @param errorOut On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
 @see customarySupportDirectory
 @return full path to Application Support directory.
 */
+ (NSString *)customarySupportDirectoryCreateIfNecessary:(BOOL)shouldCreate error:(NSError **)errorOut;


/** Get the full path to a file within the Application Support directory.
 @param filename name to add to Documents Directory
 @return Full path to file in NSDocumentDirectory
 @retval nil if not NSDocumentDirectory could not be determined.
 @retval nil if filename is nil
 @
 */
+(NSString *)customarySupportWithFile:(NSString *)filename;

/** Append path components to the Application Support directory.
 @param pathComponents path components to append
 @return full path to components in NSDocumentDirectory
 @retval nil if NSDocumentsDirectory could not be determined.
 @retval nil if pathComponenets is nil
 */
+(NSString *)customarySupportWithPathComponents:(NSArray *)pathComponents;

@end
