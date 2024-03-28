//
//  DSPaths+ApplicationSupport.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
import Foundation

public extension DSPaths {
    /// Get the \em Customary Application Support directory.
    /// @note By convention, the \em Customary Application Support directory is the full path to the NSApplicationSupportDirectory followed by the name of the application.  For example:
    /// \begincode
    /// /Users/person/Library/Application Support/ExampleApp/
    /// \endcode
    /// The name of the application is determined by reading the CFBundleExecutable value at runtime.

    /* In iOS, the directory returned by NSApplicationSupportDirectory is technically writable.  However, by convention, we normally expect the application name to be embeeded below it, like so:

     /Users/person/Library/Application Support/ExampleApp/

     Ref: http://www.cocoawithlove.com/2010/05/finding-or-creating-application-support.html

     If CFBundleExecutable does not exist, "UnnamedApp" will be used instead.
     */
    class var customarySupportDirectory: String {
        let executableName = (Bundle.main.infoDictionary?["CFBundleExecutable"] as? String) ?? "UnnamedApp"
        let result = self.support(withPathComponents: [executableName])
        return result
    }

    /// Get the \em Customary Application Support directory and create it if necessary.
    /// @note By convention, the \em Customary Application Support directory is the full path to the NSApplicationSupportDirectory followed by the name of the application.  For example:
    /// \begincode
    /// /Users/person/Library/Application Support/ExampleApp/
    /// \endcode
    /// The name of the application is determined by reading the CFBundleExecutable value at runtime.
    /// - Parameters:
    ///   - shouldCreate: Specify \em TRUE to create the path and intermediate paths if necessary.
    ///   - errorOut: On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
    /// - seealso: customarySupportDirectory
    /// - Returns: full path to Application Support directory.
    class func customarySupportDirectoryCreateIfNecessary(_ shouldCreate: Bool) throws -> String {
        let path = self.customarySupportDirectory

        if shouldCreate {
            try self.createDirectory(path)
        }

        return path
    }

    /// Get the full path to a file within the Application Support directory.
    /// - Parameter filename: name to add to Documents Directory
    /// - Returns: Full path to file in NSDocumentDirectory
    /// @retval nil if not NSDocumentDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func customarySupport(withFile filename: String) -> String {
        let path = self.customarySupportDirectory

        return NSString.path(withComponents: [path, filename].compactMap { $0 })
    }

    /// Append path components to the Application Support directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to components in NSDocumentDirectory
    /// @retval nil if NSDocumentsDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func customarySupport(withPathComponents pathComponents: [String]) -> String {
        let path = self.customarySupportDirectory
        if pathComponents.isEmpty {
            return path
        }

        var array = [path]
        array.append(contentsOf: pathComponents)

        let rtn = NSString.path(withComponents: array)

        return rtn
    }
}

//
//  DSPaths+ApplicationSupport.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
